class Admin::UserController < Admin::BaseController
  
  def index
    @users = User.find(:all)
  end
  
  def create
    @user = User.new(@params['user'])
    if @request.post? and @user.save
      flash['notice'] = "User added successfully"
      redirect_to :action=>"index"
    end
  end
  
  def edit
    @user = User.find(@params['id'])
    @user.attributes = @params['user']
    if @request.post? and @user.update
      flash['notice'] = "User updated successfully"
      redirect_to :action=>"index"
    end
    @user.password = @user.password_confirmation = ''
  end
  
  def delete
    @user = User.find(@params['id'])
    if @user.destroy
      flash['notice'] = "User deleted successfully"
      redirect_to :action=>"index"
    end
  end
  
end
