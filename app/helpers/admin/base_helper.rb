module Admin::BaseHelper
  
  def tab(label, options = {})
      content_tag :li, link_to(label, options)
  end
  
  def render_flash
    output = []

    for key,value in @flash
      output << "<span class=\"#{key.downcase}\">#{value}</span>"
    end if @flash

    output.join("<br/>\n")
  end
  
end
