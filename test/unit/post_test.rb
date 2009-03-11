require File.dirname(__FILE__) + '/../test_helper'

class PostTest < Test::Unit::TestCase
  fixtures :all
  
  should_belong_to :feed
  
  
end
