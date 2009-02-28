module PostsHelper
  
  def server_url_for(options = {})
    "http://" << request.host << request.port_string << url_for(options)
  end

  def pub_date(time)
    time.rfc822
  end

  def post_title(post)
    author = post.author || post.feed.author
    "#{author}: #{post.title}"
  end

  def post_link(post)          
    post.url
  end

  def post_body(post)          
    CGI::escapeHTML(post.body)
  end
  
end
