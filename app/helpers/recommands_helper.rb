module RecommandsHelper  
  
  def format_visible(recommendation)
    if recommendation.visible
      content_tag(:span,'已公开',:style => 'background:#006600;color:#fff;font-size:14px;')
    else
      content_tag(:span,'未公开',:style => 'background:#996600;color:#fff;font-size:14px;') 
    end               
  end
end
