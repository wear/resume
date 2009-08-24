module Admin::UsersHelper
  def resume_status(u)
    if u.resume.nil? 
       '没有创建' 
    else     
     completeness ||= resume_completeness(u.resume)
     percent = completeness[:score]
     number_to_percentage(percent)
   end
  end 
    
end
