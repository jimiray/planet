class AccountController < ApplicationController

  layout  'login'

  def login
    case @request.method
      when :post
        if @session['user'] = User.authenticate(@params['user_login'], @params['user_password'])
          flash['notice']  = "Login successful"
          redirect_back_or_default :controller => "admin/feed", :action => "index"
        else
          @login    = @params['user_login']
          @message  = "Login unsuccessful"
      end
    end
  end   
    
  def logout
    @session['user'] = nil
  end
  
end
