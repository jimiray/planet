require 'feedzirra'

class Feed < ActiveRecord::Base
  
  has_many :posts, :dependent => :delete_all
  
  named_scope :approved, :conditions => ['approved=1']
  
  #acts_as_paranoid
  
  def find_by_content(title, body)
    posts.find_all(["title=? AND body=?", title, body],nil,"LIMIT 1").first
  end
  
  def validate_on_create
    unless valid_feed?(self.url)
      errors.add("url", "is not a valid feed")
    end
  end
  
  def self.fetch_all
    feed_array = []
    feeds = Feed.approved
    feeds.collect {|feed| feed_array << feed.url}
    contents = Feedzirra::Feed.fetch_and_parse(feed_array)
    contents.each do |key, values|
      #feed = find_by_url(key)
      update_entries(key, values.entries)
    end
    
    
    
  end
  
  def self.update_entries(feed, entries)
    f = find_by_url(feed)
    entries.each do |item|
      unless post = f.posts.find(:first, :conditions=>["guid=? OR title=?", item.guid, item.title])
        post = f.posts.build 
      end
      if post.title != item.title or post.body != item.description or post.url != item.link
        tags = Array.new
        item.categories.each do |category|
          tags << category.category.gsub(" ", "_").downcase.chomp
        end
        post.url = item.url or raise "post has no link tag"
        post.title = item.title or "no title"
        post.body = item.summary or "no text"
        post.created_at = item.published if item.published
        post.guid = item.guid
        post.author = item.author
        post.created_at = item.dc_date if item.respond_to?(:dc_date) && item.dc_date
        post.save
        post.tag_names = tags.join(" ")
        post.save
      end
    end
  end
  
  private
  
  validates_presence_of :url
  #validates_uniqueness_of :url, :title, :link, :message=>"is already available"
  
  def valid_feed?(url)
    rss = Feedzirra::Feed.fetch_and_parse(self.url)
    write_attribute :title, rss.title if rss.title
    write_attribute :link, rss.url if rss.url
  end
  
end
