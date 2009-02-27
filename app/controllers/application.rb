# The filters added to this controller will be run for all controllers in the application.
# Likewise will all the methods added be available for all controllers.
class ApplicationController < ActionController::Base
  
  include Clearance::App::Controllers::ApplicationController

  before_filter :reload_settings
    
  protect_from_forgery :secret => '3bf67192881e9595a51a41f657ca7a5e'

  private
  
  def reload_settings
    #unless @request.instance_variable_get(:@config_reloaded)
    #  @request.instance_variable_set(:@config_reloaded, true)
    #  config.reload
    #end
  end
  
  def get_theme
    config[:theme]
  end
  
end
