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
    Time.now.year - birth.strftime("%Y").to_i  if birth
  end
  
  def state_type(type)
    (type == 'error') ? 'error' : 'highlight'
  end 
  
  def avatar_for(resume,width=77,heigth=99)
    if resume.avatar_exists?
      image_tag((APP_URL + resume.assert.public_filename),:alt => "avatar",:size => "#{width}x#{heigth}")
    else  
      image_tag((APP_URL + '/images/unknow-avatar.jpg'),:alt => "avatar",:size => "#{width}x#{heigth}")
    end
  end
  
  def avatar_for_pdf(resume)
    if resume.avatar_exists?
      resume.personalinfo.assert.public_filename
    else  
      'images/unknow-avatar.jpg'
    end
  end
  
  def resume_completeness(resume)
    segments = [ 
      {:val => 2, :action => link_to('个人信息', edit_resume_path(resume)), :test => !resume.name.nil? },         
      {:val => 2, :action => link_to('添加一寸照', edit_resume_path(resume)), :test => resume.avatar_exists? },
      {:val => 1, :action => link_to('添加个人总结', edit_resume_summary_path(resume)), :test => !(resume.summary.content == '暂无')},      
      {:val => 2, :action => link_to('增加工作经验', new_resume_position_path(resume)), :test => resume.positions.any? },            
      {:val => 1, :action => link_to('填写个人兴趣爱好', edit_resume_additionalinfo_path(resume)), :test => !(resume.additionalinfo.interests== '暂无')},                  
      {:val => 1, :action => link_to('教育情况介绍', new_resume_education_path(resume)), :test => resume.educations.any? },   
      {:val => 4, :action => link_to('请求评价', ask_user_recommendations_path(resume.user)), :test => resume.user.received_recommendations.nil? }
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
    resume.user.login + '的简历' + '(' + resume_lang(resume) + ')' 
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
  
  def message_req(user,message)
    case message.req_type 
  	when 'recommendation' 
  	 content_tag(:li,link_to('评价对方',new_user_recommendation_path(user,:receiver_id => message.sender )))
  	when 'edit_recommendation' 
  	 content_tag(:li,link_to('修订评价',edit_user_recommendation_path(user,message.req_id,:receiver_id => message.sender )))
  	when 'new_recommendation'
  	  recommendation = Recommendation.find(message.req_id)
  	  content_tag(:li,link_to('查看/修改',edit_visible_user_recommendation_path(user,recommendation)))
  	when 'request_friend'       
  	  receiver = User.find(message.req_id)
  	  content_tag(:li,link_to('同意加对方为好友',user_friendships_path(user,:receiver => receiver.id),:method => :post))  
	 else
	   content_tag(:li,link_to("回复", new_user_message_path(user, :reply_to => message)))
	 end
  end  
  
   def edit_visible(user,recommendation)         
     if recommendation.visible     
       link_to '不公开',visible_user_recommendation_path(user,recommendation,:visible => false),:method => :put,:class=> 'ag'
     else
       link_to '公开',visible_user_recommendation_path(user,recommendation,:visible => true),:method => :put,:class=> 'ag' 
     end
  end
  
  def resume_status(u)
    if u.resume.nil? 
       '没有创建' 
    else     
     completeness ||= resume_completeness(u.resume)
     percent = completeness[:score]
     number_to_percentage(percent)
   end
  end
  
  def resume_center_path(resume)
    if resume.nil? || resume.new_record?
      new_resume_path
    else  
      edit_resume_path(resume)
    end
  end  

	def group_icon_for(group,size)
    if group.icon_exists?
      link_to image_tag(group.asset.public_filename(size.to_sym)),group
    else  
      link_to image_tag('/images/unknow-group.gif',:size => calc_size(size)),group
    end
  end
  
  def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_minutes = (((to_time - from_time).abs)/60).round
  
    case distance_in_minutes
      when 0..1           then (distance_in_minutes==0) ? :a_few_seconds_ago.l : :one_minute_ago.l
      when 2..59          then "#{distance_in_minutes} "+:minutes_ago.l
      when 60..90         then :one_hour_ago.l
      when 90..1440       then "#{(distance_in_minutes.to_f / 60.0).round} "+:hours_ago.l
      when 1440..2160     then :one_day_ago.l # 1 day to 1.5 days
      when 2160..2880     then "#{(distance_in_minutes.to_f / 1440.0).round} "+:days_ago.l # 1.5 days to 2 days
      else from_time.strftime("%b %e, %Y  %l:%M%p").gsub(/([AP]M)/) { |x| x.downcase }
    end
  end

  def time_ago_in_words_or_date(date)
    if date.to_date.eql?(Time.now.to_date)
      display = I18n.l(date.to_time, :format => :time_ago)
    elsif date.to_date.eql?(Time.now.to_date - 1)
      display = :yesterday.l
    else
      display = I18n.l(date.to_date, :format => :date_ago)
    end
  end

  def default_subject(req)
    case req
    when 'request_friend'
      '好友申请'
    else
      ''
    end
  end  
  
  def default_body(req)
    case req
    when 'request_friend'
      '请加我为好友'
    else
      ''
    end
  end                  
  
  protected
  
  def calc_size(size) 
    case size
    when 'large'
      '64x64'
    else
      '48x48'
    end
  end
  
end
