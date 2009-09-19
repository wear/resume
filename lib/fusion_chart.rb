require "fusioncharts_helper"
include FusionChartsHelper  
  
module FusionChart      
  # caption is chart name
  def pie_chart_data(dataset,options={})  
    options.reverse_merge!(:caption=> '饼图',:show_name => '1',:decima_precision=>'0')
    xml = "<graph caption='#{options[:caption]}' showNames='#{options[:show_name]}' decimalPrecision='#{options[:decima_precision]}'>"
    dataset.each do |name, data|
      xml << "<set name='#{name}' value='#{data}' />"
    end
    xml << "</graph>"
  end  
  
  def line_chart_data(dataset,options={})
    options.reverse_merge!(:caption=> '线图',:y_axis_min_value=>'0',:y_axis_name => 'y轴',:number_prefix=> '单位',:x_axis_name => 'x轴',:decima_precision=>'0',:format_number_scale => '0')      
    xml = "<graph yAxisMinValue='#{options[:y_axis_min_value]}' yAxisName='#{options[:y_axis_name]}' numberPrefix='#{options[:number_prefix]}'" +
    "caption='#{options[:caption]}' formatNumberScale='#{options[:format_number_scale]}' decimalPrecision='#{options[:decima_precision]}' xAxisName='#{options[:x_axis_name]}' >"
    dataset.each do |name,value,text|
      xml << "<set name='#{name}' value='#{value}' hoverText='#{text}'/>"
    end
    xml << "</graph>"
  end
  
  
  def column_chart_data(dataset,options={}) 
    options.reverse_merge!(:caption=> '饼图',:number_prefix => '¥',:format_number_scale=>'0',:decimal_precision => '0')
    xml = "<graph caption='#{options[:caption]}' numberPrefix='#{options[:number_prefix]}' formatNumberScale='#{options[:format_number_scale]}' decimalPrecision='#{options[:decimal_precision]}'>"
    dataset.each do |name, data|
      xml << "<set name='#{name}' value='#{data}' color='#{get_FC_color}' />"
    end
    xml << "</graph>"
  end
end