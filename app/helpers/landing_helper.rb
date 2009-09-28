module LandingHelper
  def tag_cloud(tags, classes)
    return if tags.empty?
    
    max_count = @arr_data.sort.last[0].to_f
    
    tags.each do |size,tag|
      index = ((size / max_count) * (classes.size - 1)).round
      yield tag, classes[index]
    end
  end
end
