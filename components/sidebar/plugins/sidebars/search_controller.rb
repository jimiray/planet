class Plugins::Sidebars::SearchController < Sidebars::Plugin
  
  def self.display_name
    "Search"
  end

  def self.description
    "Site search"
  end
  
  def self.default_config
    {'title'=>"Search", 'live' => true}
  end
  
  def content
  end
  
  def configure
  end
end
