require 'active_model/serializers/xml'
class Product < ApplicationRecord
  include ActiveModel::Serializers::Xml

  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, length: {minimum: 10}
  validates :image_url, allow_blank: true, format: {
    with: /(?i)\.(gif|jpg|png)\Z/,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Item present')
      throw :abort
    end
  end
end
