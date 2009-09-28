class ResumeSweeper < ActionController::Caching::Sweeper  
  observe Resume
  
  # If our sweeper detects that a resume was created call this  
  def after_create(resume)  
    expire_cache_for(resume)  
  end  
  
  # If our sweeper detects that a resume was updated call this  
  def after_update(resume)  
    expire_cache_for(resume)  
  end  
  
  # If our sweeper detects that a resume was deletedcall this  
  def after_destroy(resume)  
    expire_cache_for(resume)  
  end
  
  
 private  
 def expire_cache_for(record)  
   # Also expire the show page, in case we just edit a  blog entry  
   expire_page(:controller => 'resumes', :action => 'public', :id => record.id)  
 end
  
end   