require 'active_model/serializers/xml'

class Order < ApplicationRecord
  include ActiveModel::Serializers::Xml

  enum pay_type: {
    check: 'Check',
    credit_cart: 'Credit card',
    purchase_order: 'Purchase order'
  }

  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
