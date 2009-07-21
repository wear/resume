# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_sex(sex)
    case sex
    when 'm'
      '男'
    when 'f'
      '女'
    end
  end    
 
  def admin_required?
    logged_in? && current_user.roles.include?('superuser')
  end
  
  def format_age(birth)
    Time.now.year - birth.strftime("%Y").to_i
  end
  
  def state_type(type)
    (type == 'error') ? 'error' : 'highlight'
  end 
  
  def avatar_for(profile)
    if profile.avatar_exists?
      image_tag(profile.assert.public_filename)
    else  
      image_tag('/images/unknow-avatar.jpg')
    end
  end
  
  def avatar_for_pdf(profile)
    if profile.avatar_exists?
      profile.assert.public_filename
    else  
      '/images/unknow-avatar.jpg'
    end
  end
  
  def profile_completeness(resume)
    segments = [
      {:val => 2, :action => link_to('添加一寸照', edit_resume_profile_path(resume)), :test => resume.profile.avatar_exists? },
      {:val => 1, :action => link_to('添加个人总结', edit_resume_summary_path(resume)), :test => !(resume.summary.content == '暂无')},      
      {:val => 2, :action => link_to('增加工作经验', new_resume_position_path(resume)), :test => resume.positions.any? },            
      {:val => 1, :action => link_to('填写个人兴趣爱好', edit_resume_additionalinfo_path(resume)), :test => !(resume.additionalinfo.interests== '暂无')},                  
      {:val => 1, :action => link_to('教育情况介绍', new_resume_education_path(resume)), :test => resume.educations.any? }
    ]
    
    completed_score = segments.select{|s| s[:test].eql?(true)}.sum{|s| s[:val]}
    incomplete = segments.select{|s| !s[:test] }
    
    total = segments.sum{|s| s[:val] }
    score = (completed_score.to_f/total.to_f)*100

    {:score => score, :incomplete => incomplete, :total => total}
  end        
  
  def format_end_at(time)
    return '至今' if time.nil?
  end
  
end
