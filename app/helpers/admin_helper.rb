module AdminHelper                   
  # Below is helpers for fusion chart
  def pie_chart(id, data, width=300, height=300)
    html = "<div id='#{id}' style='width:#{width}px;height:#{height}px;margin:10px;'></div>"
    html << javascript_tag(%|
      var myChart = new FusionCharts("/FusionCharts/FCF_Pie3D.swf", "#{id}", "#{width}","#{height}");  
      myChart.setDataXML("#{data}")  
      myChart.render("#{id}");
    |)
  end
  
  def stacked_chart(id, data, width=600, height=300)
      html = "<div id='#{id}' style='width:#{width}px;height:#{height}px;'></div>"
      html << javascript_tag(%|
  var myChart = new FusionCharts("/swfs/StackedColumn3D.swf", "#{id}", "#{width}","#{height}");
  myChart.setDataXML("#{data}")
  myChart.render("#{id}");
  |)
  end
  
  def line_chart(id, data, width=300, height=300)
    html = "<div id='#{id}' style='width:#{width}px;height:#{height}px;text-align:center;'></div>"
    html << javascript_tag(%|
      var myChart = new FusionCharts("/FusionCharts/FCF_Line.swf", "#{id}", "#{width}", "#{height}");  
      myChart.setDataXML("#{data}")  
      myChart.render("#{id}");
    |)
  end 
  
  def column_chart(id, data, width=300, height=300)
    html = "<div id='#{id}' style='width:#{width}px;height:#{height}px;'></div>"
    html << javascript_tag(%|
    var myChart = new FusionCharts("/FusionCharts/FCF_Column3D.swf", "#{id}", "#{width}", "#{height}");
    myChart.setDataXML("#{data}")
    myChart.render("#{id}");
  |)
  end
end
