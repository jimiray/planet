#require 'simple-rss-1.0.0/lib/simple-rss'
#require 'open-uri'

class Feed < ActiveRecord::Base
  
  has_many :posts, :dependent => true
  
  def find_by_content(title, body)
    posts.find_all(["title=? AND body=?", title, body],nil,"LIMIT 1").first
  end
  
  def validate_on_create
    unless valid_feed?(self.url)
      errors.add("url", "is not a valid feed")
    end
  end
  
  private
  
  validates_presence_of :url
  #validates_uniqueness_of :url, :title, :link, :message=>"is already available"
  
  def valid_feed?(url)
    begin
      FeedTools.configurations[:feed_cache] = nil
      rss = FeedTools::Feed.open(self.url)
      write_attribute :title, rss.title if rss.title
      write_attribute :link, rss.link if rss.link
      write_attribute :feed_type, rss.feed_type if rss.feed_type
    rescue => e
      errors.add("url", "is not available")      
    end
  end
  
end
