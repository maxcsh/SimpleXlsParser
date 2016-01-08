module ApplicationHelper
  def render_price( price )
    number_to_currency( price , unit: "", precision: 2, delimiter: ",")
  end
end
