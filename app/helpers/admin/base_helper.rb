module Admin::BaseHelper
  
  def tab(label, options = {})
    if controller.controller_name =~ /#{options[:controller].split('/').last}/
      content_tag :li, link_to(label, options, {"class"=> "active"}), {"class"=> "active"}
    else
      content_tag :li, link_to(label, options)
    end
  end
  
  def render_flash
    output = []

    for key,value in @flash
      output << "<span class=\"#{key.downcase}\">#{value}</span>"
    end if @flash

    output.join("<br/>\n")
  end
  
end
