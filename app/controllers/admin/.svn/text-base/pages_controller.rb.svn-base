class Admin::PagesController < Admin::BaseController

  def index
    @pages = Page.find(:all)
  end

  def edit
    @page = Page.find(@params[:id])
    @page.attributes = @params[:page]
    if @request.post? and @page.save
      flash[:notice] = "Page updated successfully"
      redirect_to :action=>"index"
    end
  end

  def create
    @page = Page.new(@params[:page])
    if @request.post? and @page.save
      flash[:notice] = "Page Created Successfully"
      redirect_to :action=>"index"
    end
  end

  def delete
    @page = Page.find(@params[:id])
    if @page.destroy
      flash[:notice] = "Page Deleted Successfully"
      redirect_to :action=>"index"
    end
  end
  
end
