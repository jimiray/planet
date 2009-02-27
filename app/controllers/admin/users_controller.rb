class Admin::UsersController < Admin::BaseController

  before_filter :find_user, :except => [:index]
    
  def index
    @users = User.find(:all)
  end
  
  def create
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash['notice'] = "User added successfully"
      redirect_to :action=>"index"
    end
  end
  
  def edit
    @user.password = @user.password_confirmation = ''
  end
  
  def update
    @user.attributes = params[:user]
    if @user.save
      flash[:notice] = "User updated"
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end
  
  def delete
    @user = User.find(params[:id])
    if @user.destroy
      flash['notice'] = "User deleted successfully"
      redirect_to :action=>"index"
    end
  end

  protected
  
    def find_user
      @user = params[:id] ? User.find(params[:id]) : User.new
    end
    
end
