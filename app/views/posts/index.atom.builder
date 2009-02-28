xml.feed "version" => "0.3", "xml:lang"=>"en-US", "xmlns"=>"http://purl.org/atom/ns#" do

  xml.title CONFIG['planetname']
  xml.tagline "mode"=>"escaped", "type"=>"text/html"
  xml.id "tag:#{request.host},2005:Planet"
  xml.generator "Planet", "url" => "http://www.leetsoft.com"
  xml.link "rel" => "alternate", "type" => "text/html", "href" => server_url_for(:controller => "posts")

  xml.modified @posts.first.updated_at.xmlschema unless @posts.empty?

  for entry in @posts

    xml.entry do
  
      xml.author { xml.name entry.author || entry.feed.author }
      xml.id "tag:#{request.host},2005:Planet-#{entry.id}"

      xml.issued entry.created_at.xmlschema
      xml.modified entry.updated_at.xmlschema
      xml.title post_title(entry)
      xml.link "rel" => "alternate", "type" => "text/html", "href" => post_link(entry)
      xml.content entry.body, "type"=>"text/html", "mode"=>"escaped"

    end
  end   
end                                                                  
