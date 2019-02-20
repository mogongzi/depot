require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test 'received' do
    mail = OrderMailer.received(orders(:one))
    assert_equal 'The Depot Site Order Confirmation', mail.subject
    assert_equal ['ryan@example.org'], mail.to
    assert_equal ['depot@example.com'], mail.from
    assert_match /Programming Ruby 1\.9/, mail.body.encoded
  end

  test 'shipped' do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal 'The Depot Site Order Shipped', mail.subject
    assert_equal ['ryan@example.org'], mail.to
    assert_equal ['depot@example.com'], mail.from
    assert_match %r{<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>}, mail.body.encoded
  end
end
