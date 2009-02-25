class XmlController < ApplicationController
  
  def rss
    @headers["Content-Type"] = "text/xml;charset=utf-8"
    @articles = Post.find_with_feed(20)
    render :layout=>false
  end

  def atom   
    @headers["Content-Type"] = "text/xml;charset=utf-8"
    @articles = Post.find_with_feed(20)
    render :layout=>false
  end
  
  def opml
    @headers["Content-Type"] = "text/xml;charset=utf-8"
    @feeds = Feed.find(:all, :conditions=>"approved=1", :order=>"title")
    render :layout=>false
  end
  
end
