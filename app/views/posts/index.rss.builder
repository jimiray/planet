xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.instruct! 'xml-stylesheet', :type=>"text/css", :href => url_for("/stylesheets/rss.css")
xml.rss "version"=>"2.0", "xmlns:dc"=>"http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title CONFIG['planetname']
    xml.link server_url_for(posts_path)
    xml.language "en-us"
    xml.ttl "40"

    for entry in @posts
      xml.item do
        if entry.body
        	xml.title post_title(entry)
        	xml.description entry.body
        	xml.pubDate pub_date(entry.created_at)
        	xml.guid entry.guid
					xml.author entry.author || entry.feed.author
					xml.source entry.url
        	xml.link post_link(entry)
					for tag in entry.tags
				    xml.category tag.name
				  end
        end
      end
    end
  end
end
