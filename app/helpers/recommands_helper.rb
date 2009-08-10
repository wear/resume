module RecommandsHelper 
  def edit_visible(user,recommendation)         
     if recommendation.visible     
       link_to '不公开',visible_user_recommendation_path(user,recommendation,:visible => false),:method => :put,:class=> 'ag'
     else
       link_to '公开',visible_user_recommendation_path(user,recommendation,:visible => true),:method => :put,:class=> 'ag' 
     end
  end
end
