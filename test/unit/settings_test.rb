require File.dirname(__FILE__) + '/../test_helper'

class SettingsTest < Test::Unit::TestCase
  fixtures :settings

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Settings, settings(:first)
  end
end
