pdf.font "#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf"
avatar = "#{RAILS_ROOT}"+"/public/#{avatar_for_pdf(@resume.profile)}"
pdf.text_options.update(:wrap => :character)
 pdf.stroke_color "999999"
pdf.bounding_box [5,720], :width => 220  do

pdf.image avatar, :at => [57,0]

pdf.stroke_rectangle [56,0], 79, 99
end   
pdf.bounding_box [240,700], :width => 220  do 
  pdf.text "#{@resume.profile.name}",:size => 32
end 
# 个人资料
pdf.bounding_box [5,600], :width => 220 do
pdf.fill_color "999999"  
  pdf.text "个人信息",:size => 18
pdf.fill_color "090B18"  
  pdf.move_down 10
  pdf.table [[ "性别:", "#{format_sex(@resume.profile.sex) }"],  ["出生地:","#{@resume.profile.hometwon}"],["户口所在地:","#{@resume.profile.hukou}"],["年龄:","#{format_age(@resume.profile.birthday)}"],["生日:","#{@resume.profile.birthday}"]],
    :widths => { 0 => 200, 1 => 250 }, :position => 5,	:border_width => 0,:align => :left
  pdf.move_down 20
end

pdf.bounding_box [240,600], :width => 220 do 
pdf.fill_color "999999" 
  pdf.text '联系方式',:size => 18  
pdf.fill_color "090B18" 
pdf.move_down 10   
  pdf.table [[ "地址:", "#{ @resume.profile.address }"],  ["电子邮件:","#{@resume.profile.email}"],["手机:","#{@resume.profile.mobile}"]],
    :widths => { 0 => 200, 1 => 250 }, :position => 5,	:border_width => 0,:align => :left
	
  pdf.move_down 20
end   

pdf.move_down 40   
pdf.stroke_horizontal_rule


#总结 
pdf.move_down 20 
pdf.bounding_box [5,pdf.cursor], :width => 100 do
pdf.fill_color "999999"      
	pdf.text '总结',:size => 18 
pdf.fill_color "090B18" 
end      
pdf.bounding_box [100,pdf.cursor + 20],:width => 340 do
  pdf.text " #{@resume.summary.content}"
end
pdf.move_down 20  
pdf.bounding_box [5,pdf.cursor], :width => 100 do 
pdf.fill_color "090B18" 
end      
pdf.bounding_box [100,pdf.cursor + 20],:width => 340 do
  pdf.text " #{@resume.summary.tag_list}"
end
pdf.move_down 20 
pdf.stroke_horizontal_rule
pdf.move_down 20

pdf.bounding_box [0,pdf.cursor], :width => 100 do
pdf.fill_color "999999"      
	pdf.text '工作经验',:size => 18 
pdf.fill_color "090B18" 
end                            

pdf.bounding_box [100,pdf.cursor + 20], :width => 300 do
   if  @resume.positions.blank?
	pdf.text '暂无'
   else
	@resume.positions.each_with_index do |position,index|     
		pdf.text "#{position.title}",:size => 18
		pdf.text "#{position.company}"
		pdf.text "#{position.start_at} >> #{format_end_at(position.end_at)}",:at => [240,20],:size => 8 
	end
	end
end
pdf.move_down 20 
pdf.stroke_horizontal_rule 
pdf.move_down 20 
 
pdf.bounding_box [5,pdf.cursor], :width => 100 do 
pdf.fill_color "999999"     
   pdf.text '兴趣爱好',:size => 18
pdf.fill_color "090B18"     
end                            

pdf.bounding_box [100,pdf.cursor + 20], :width => 320 do
	pdf.table [[ "爱好:", "#{@resume.additionalinfo.interests}"],  ["小组:","#{@resume.additionalinfo.groups}"],["获奖:","#{@resume.additionalinfo.awards}"]],
   :column_widths => {0 => 40,1 => 300},:align => :left,:border_width => 0
pdf.move_down 20 
end          
pdf.stroke_horizontal_rule 
pdf.move_down 20

pdf.bounding_box [5,pdf.cursor], :width => 100 do 
pdf.fill_color "999999"     
   pdf.text '教育',:size => 18
pdf.fill_color "090B18"     
end
pdf.bounding_box [100,pdf.cursor + 20], :width => 320 do
@resume.educations.each do |education|
pdf.text "#{education.name}",:size => 18
pdf.text "#{education.degree}" 
pdf.text "#{education.field}" 
pdf.text "#{education.start_at.to_s(:date_edu)} >> #{education.end_at.to_s(:date_edu)}",:at => [260,35],:size => 8
pdf.move_down 20
end 
end