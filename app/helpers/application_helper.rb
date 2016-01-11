module ApplicationHelper
  def render_price( price )
    number_to_currency( price , unit: "", precision: 2, delimiter: ",")
  end

  def redner_col_md_4( title , price )
    content_tag :div ,  "#{title} #{render_price(price)}" , :class => "col-md-4"
  end

  def render_back_btn
    link_to "取消" , :back , :class => "btn btn-default"
  end

  def render_edit_btn( title , url )
    link_to title , url , :class => "btn btn-primary btn-xs fa fa-edit"
  end
  
end
