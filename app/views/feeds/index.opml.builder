xml.instruct!
xml.opml "version" => "1.1" do
  xml.head do
    xml.title CONFIG['planet_name']
    xml.dateCreated Time.now.xmlschema
    xml.dateModified @feeds.first.updated_at.xmlschema unless @feeds.empty?
    xml.ownerName  "jim ray"
    xml.ownerEmail "jim@mosaicglobe.com"
  end

  xml.body do
  
   for feed in @feeds
      xml.outline("text"=>CGI::escapeHTML(feed.title), "xmlUrl"=>feed.url)
    end
  
  end   
end
