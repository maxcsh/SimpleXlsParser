module ApplicationHelper
  def render_price( price )
    number_to_currency( price , unit: "", precision: 2, delimiter: ",")
  end

  def redner_col_md_4( title , price )
    content_tag :div ,  "#{title} #{render_price(price)}" , :class => "col-md-4"
  end
end
