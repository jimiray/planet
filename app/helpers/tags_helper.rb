module TagsHelper
  
  def tag_cloud(tag_cloud, category_list)
    max, min = 0, 0
    tag_cloud.each_value do |count|
      max = count if count > max
      min = count if count < min
    end

    divisor = ((max - min) / category_list.size) + 1

    tag_cloud.each do |tag, count|
      yield tag, category_list[(count - min) / divisor]
    end
  end
  
end
