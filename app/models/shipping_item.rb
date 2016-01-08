class ShippingItem < ActiveRecord::Base
  belongs_to :shipping_list
  before_validation :calculate_sum_price


  private

  def calculate_sum_price
    self.sum_price = ( self.amount * self.unit_price ).round(0) if self.amount && self.unit_price
  end

end
