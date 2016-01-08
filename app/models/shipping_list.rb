class ShippingList < ActiveRecord::Base
  belongs_to :bill
  has_many :shipping_items

  before_validation :calculate_price

  private

  def calculate_price
    sum = 0
    self.shipping_items.each { |item| sum += item.sum_price if !item.sum_price.blank? }
    self.total_price = sum
    self.tax_price = ( self.total_price * 1.05 ).round(0)
  end
end
