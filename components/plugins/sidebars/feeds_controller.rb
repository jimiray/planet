class Plugins::Sidebars::FeedsController < Sidebars::Plugin
  def self.display_name
    "Feed Display"
  end

  def self.description
    "List of All Feeds"
  end
  
  def self.default_config
    {'title'=>"Feeds", 'all' => true}
  end
  
  def content
    if @sb_config['all'] == true
      @feeds = Feed.find(:all, :conditions=>"approved=1", :order=>"title")
    else
      @feeds = Feed.find(:all, :order=>"title")
    end
  end
  
  def configure
  end
end
