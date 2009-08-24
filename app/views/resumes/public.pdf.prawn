pdf.font "#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf"
avatar = "#{RAILS_ROOT}"+"/public/#{avatar_for_pdf(@resume)}"
pdf.text_options.update(:wrap => :character) 
pdf.stroke_color "999999"
pdf.bounding_box [5,720], :width => 220  do

pdf.image avatar, :at => [57,0]

pdf.stroke_rectangle [56,0], 79, 99
end   
pdf.bounding_box [240,700], :width => 220  do 
  pdf.text "#{@resume.personalinfo.name}",:size => 32
end 
# 个人资料
pdf.bounding_box [5,600], :width => 220  do
pdf.fill_color "999999"  
  pdf.text "#{t(:pro)}",:size => 18
pdf.fill_color "090B18"  
  pdf.move_down 10
  pdf.table [[ "#{t(:sex)}:", "#{format_sex(@resume.personalinfo.sex) }"],  ["#{t(:hometown)}:","#{@resume.personalinfo.hometwon}"],["#{t(:hukou)}:","#{@resume.personalinfo.hukou}"],["#{t(:age)}:","#{format_age(@resume.personalinfo.birthday)}"],["#{t(:birth)}:","#{@resume.personalinfo.birthday}"]],
    :column_widths => {0=>60, 1=>160}, :position => 5,	:border_width => 0,:align =>:left
  pdf.move_down 20
end

pdf.bounding_box [240,600], :width => 220 do 
pdf.fill_color "999999" 
  pdf.text "#{t(:contact)}",:size => 18  
pdf.fill_color "090B18" 
pdf.move_down 10   
  pdf.table [[ "#{t(:adr)}:", "#{ @resume.personalinfo.address }"],  ["Email:","#{@resume.personalinfo.email}"],["#{t(:mobile)}:","#{@resume.personalinfo.mobile}"]],
     :column_widths => {0=> 60,1=>160}, :position => 5, :border_width => 0,:align => :left
	
  pdf.move_down 20
end   

pdf.move_down 40   
pdf.stroke_horizontal_rule


#总结 
pdf.move_down 20 
pdf.bounding_box [5,pdf.cursor], :width => 100 do
pdf.fill_color "999999"      
	pdf.text "#{t :summary}",:size => 18 
pdf.fill_color "090B18" 
end      


pdf.move_down 20  
pdf.bounding_box [5,pdf.cursor], :width => 100 do 
pdf.fill_color "090B18" 
pdf.bounding_box [100,pdf.cursor + 40],:width => 380 do 
  pdf.text " #{@resume.summary.content}"
end
end      
pdf.move_down 20 
pdf.stroke_horizontal_rule
pdf.move_down 20

pdf.bounding_box [0,pdf.cursor], :width => 100 do
pdf.fill_color "999999"      
	pdf.text "#{t(:positions)}",:size => 18 
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
 
pdf.bounding_box [5,pdf.cursor], :width => 120 do 
pdf.fill_color "999999"     
pdf.text "#{t(:intresters)}",:size => 18
pdf.fill_color "090B18"     
end                            

pdf.bounding_box [100,pdf.cursor + 20], :width => 300,:height => 200 do
	pdf.table [[ "#{t(:intresters)}:", "#{@resume.additionalinfo.interests}"],  ["#{t(:groups)}:","#{@resume.additionalinfo.groups}"],["#{t(:awards)}:","#{@resume.additionalinfo.awards}"]],
   :column_widths => {0 => 80,1 => 300},:align => :left,:border_width => 0
pdf.move_down 20 
end          
pdf.stroke_horizontal_rule 
pdf.move_down 20

pdf.bounding_box [5,pdf.cursor], :width => 120 do 
pdf.fill_color "999999"     
   pdf.text "#{t(:edu)}",:size => 18
pdf.fill_color "090B18"     
end
pdf.bounding_box [130,pdf.cursor + 20], :width => 320 do
@resume.educations.each do |education|
pdf.text "#{education.name}",:size => 18
pdf.text "#{education.degree}" 
pdf.text "#{education.field}" 
pdf.text "#{education.start_at.to_s(:date_edu)} >> #{education.end_at.to_s(:date_edu)}",:at => [260,35],:size => 8
pdf.move_down 20
end  
pdf.move_down 20
end  

pdf.start_new_page


pdf.bounding_box [5,pdf.cursor], :width => 140 do 
pdf.fill_color "999999"     
   pdf.text "#{t(:recommendations)}",:size => 18
pdf.fill_color "090B18"     
end

pdf.bounding_box [160,pdf.cursor + 20], :width => 320 do
@user.received_recommendations.visible.each do |recommendation|

pdf.text "#{h recommendation.desc}"
pdf.move_down 10 
pdf.text "#{h recommendation.sender.resume_name}" 
pdf.fill_color "999999"    
	pdf.text  "#{recommendation.sender_role}",:at => [50,3]
pdf.fill_color "090B18"  
pdf.move_down 5
pdf.fill_color "999999"
	pdf.text "#{h @resume.personalinfo.name}" + '是' + "#{h(recommendation.sender.resume.personalinfo.name)}" + '的' + "#{format_refer(recommendation.refer_type)}"  
pdf.fill_color "090B18"        
pdf.move_down 20 
pdf.stroke_horizontal_rule 
pdf.move_down 20 
end 
pdf.move_down 20
end   
