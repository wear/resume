# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_sex(sex)
    case sex
    when 'm'
      t(:male)
    when 'f'
      t(:female)
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
  
  def avatar_for(resume,width=77,heigth=99)
    if resume.avatar_exists?
      image_tag((APP_URL + resume.personalinfo.assert.public_filename),:alt => "avatar",:size => "#{width}x#{heigth}")
    else  
      image_tag((APP_URL + '/images/unknow-avatar.jpg'),:alt => "avatar",:size => "#{width}x#{heigth}")
    end
  end
  
  def avatar_for_pdf(profile)
    if profile.avatar_exists?
      profile.assert.public_filename
    else  
      'images/unknow-avatar.jpg'
    end
  end
  
  def resume_completeness(resume)
    segments = [
      {:val => 2, :action => link_to('添加一寸照', edit_resume_personalinfo_path(resume)), :test => resume.avatar_exists? },
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
      if time.nil?
        '至今'
      else
        time
      end
  end
  
  def option_groups_for_select(collection,selected = nil)
    collection.inject('') do |options_for_select,group|
      group_label_string = group[0]
      options_for_select = "<optgroup label=\"#{html_escape(group_label_string)}\">"
      options_for_select += options_for_select(group[1..-1],selected)
      options_for_select += '</optgroup>'
    end
  end
  
  def topnav_tab(name, options)
    classes = [options.delete(:class)]
    classes << 'current' if options[:section] && (options.delete(:section).to_a.include?(@section))
    
    "<li class='#{classes.join(' ')}'>" + link_to( "<span>"+name+"</span>", options.delete(:url), options) + "</li>"
  end
  
  def name_for_resume(resume)
    resume.user.login + '的简历' + (resume.user.resumes.index(resume) + 1).to_s + '(' + resume_lang(resume) + ')' 
  end  
  
  def resume_lang(resume)
     case resume.lang
     when 'cn'
       '中文'
     when 'en'
       'English'
     end
  end 
  
  def format_refer(refer)
    (SCHOOL + COLLEAGUE).select{|v| v[1] == refer }[0][0]
  end
end
