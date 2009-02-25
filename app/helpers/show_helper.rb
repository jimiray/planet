module ShowHelper
  
  def prev_page(pages)
  if !@params[:q]
    content_tag("div", 
                link_to("&#171; previous page", { :page => pages.current.previous }),
                :class=>"left-floaty")
   else
     content_tag("div", 
                 link_to("&#171; previous page", { :page => pages.current.previous, :q=>@params[:q] }),
                 :class=>"left-floaty")
    end     
                
  end
  
  def next_page(pages)
    if !@params[:q]
    content_tag("div", 
                link_to("next page &#187;", { :page => pages.current.next }),
                :class=>"right-floaty")
    else
      content_tag("div", 
                  link_to("next page &#187;", { :page => pages.current.next, :q=>@params[:q] }),
                  :class=>"right-floaty")   
    end   
  end
  
  def server_url_for(options = {})
    "http://" << @request.host << @request.port_string << url_for(options)
  end
  
end
