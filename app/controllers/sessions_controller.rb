class SessionsController < ApplicationController
  include Clearance::App::Controllers::SessionsController
  
  layout 'login'
  
end
