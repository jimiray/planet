require File.dirname(__FILE__) + '/../test_helper'

class FeedTest < Test::Unit::TestCase

  fixtures :all
  
  should_have_many :posts

  should_validate_presence_of :url
    
end
