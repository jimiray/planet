require File.dirname(__FILE__) + '/../test_helper'
require 'feed_controller'

# Re-raise errors caught by the controller.
class FeedController; def rescue_action(e) raise e end; end

class FeedControllerTest < Test::Unit::TestCase
  fixtures :feeds

  def setup
    @controller = FeedController.new
    @request, @response = ActionController::TestRequest.new, ActionController::TestResponse.new
  end

  def test_index
    process :index
    assert_rendered_file 'list'
  end

  def test_list
    process :list
    assert_rendered_file 'list'
    assert_template_has 'feeds'
  end

  def test_show
    process :show, 'id' => 1
    assert_rendered_file 'show'
    assert_template_has 'feed'
    assert_valid_record 'feed'
  end

  def test_new
    process :new
    assert_rendered_file 'new'
    assert_template_has 'feed'
  end

  def test_create
    num_feeds = Feed.find_all.size

    process :create, 'feed' => { }
    assert_redirected_to :action => 'list'

    assert_equal num_feeds + 1, Feed.find_all.size
  end

  def test_edit
    process :edit, 'id' => 1
    assert_rendered_file 'edit'
    assert_template_has 'feed'
    assert_valid_record 'feed'
  end

  def test_update
    process :update, 'feed' => { 'id' => 1 }
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Feed.find(1)

    process :destroy, 'id' => 1
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      feed = Feed.find(1)
    }
  end
end
