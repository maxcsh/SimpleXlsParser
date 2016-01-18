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

  def render_btn_container( title , url )
    content_tag :div , :class => "col-sm-3" , :style => "padding:5px; margin-top:10px;" do
    link_to url , :class => "" , :style => "" do      
        content_tag :div , title , :class => "big-btn " , :style => ""      
    end
    end
  end

   def render_toolbtn( title , url )
    content_tag :div , :class => "col-sm-3" , :style => "margin:10px 0; padding:0 5px;" do
      link_to title , url , :style => "margin:10px 0;" , :class => "tool-btn"
    end
  end
  
end
