require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products
  include ActiveJob::TestHelper

  test 'buying a product' do
    start_order_count = Order.count
    java_book = products(:java)

    get '/'
    assert_response :success
    assert_select 'h1', 'Your Pragmatic Catalog'

    post '/line_items', params: { product_id: java_book.id }, xhr: true
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal java_book, cart.line_items[0].product

    get '/orders/new'
    assert_response :success
    assert_select 'legend', 'Please Enter Your Details'

    perform_enqueued_jobs do
      post '/orders', params: {
        order: {
          name: 'Ryan Ren',
          address: 'Chenhui Road 1001',
          email: 'ryan@example.com',
          pay_type: 'Check'
        }
      }

      follow_redirect!

      assert_response :success
      assert_select 'h1', 'Your Pragmatic Catalog'
      cart = Cart.find(session[:cart_id])
      assert_equal 0, cart.line_items.size

      assert_equal start_order_count + 1, Order.count
      order = Order.last

      assert_equal 'Ryan Ren', order.name
      assert_equal 'Chenhui Road 1001', order.address
      assert_equal 'ryan@example.com', order.email
      assert_equal 'Check', order.pay_type

      assert_equal 1, order.line_items.size
      line_item = order.line_items[0]
      assert_equal java_book, line_item.product

      mail = ActionMailer::Base.deliveries.last
      assert_equal ['ryan@example.com'], mail.to
      assert_equal 'The Depot<depot@example.com>', mail[:from].value
      assert_equal 'The Depot Site Order Confirmation', mail.subject
    end
  end
end
