class Admin::BaseController < ApplicationController

  layout "admin"
  #before_filter :login_required
  before_filter :authenticate

end
