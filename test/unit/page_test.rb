require File.dirname(__FILE__) + '/../test_helper'

class PageTest < Test::Unit::TestCase
  fixtures :pages

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Page, pages(:first)
  end
end
