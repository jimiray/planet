class Admin::FeedsController < Admin::BaseController
  
  before_filter :authenticate
  
  def index
   @feeds = Feed.paginate :page => params[:page], :per_page => 30, :order => 'created_at DESC'
   # @pages, @feeds = paginate :feeds, :per_page=>30, :order_by => 'id DESC'
  end
  
  def new
    
  end
  
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash['notice'] = "Feed Created Successfully"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @feed = Feed.find(params[:id])
  end
  
  def update
    @feed = Feed.find(params[:id])
    @feed.attributes = params[:feed]
    if @feed.save
      flash['notice'] = "Feed updated successfully"
      redirect_to :action=>"index"
    end
  end
  
  def publish
    @feed = Feed.find(params[:id])
    @feed.approved = 1;
    if @feed.save
      flash['notice'] = "Feed #{@feed.title} published"
      redirect_to :action=>"index"
    end
  end
  
  def unpublish
    @feed = Feed.find(params[:id])
    @feed.approved = 0;
    if @feed.save
      flash['notice'] = "Feed #{@feed.title} unpublished"
      redirect_to :action=>"index"
    end
  end
  
  def destroy
    @feed = Feed.find(params[:id])
    if @feed.destroy
      flash['notice'] = "Feed Deleted successfully"
      redirect_to :action=>"index"
    end
  end
  
end
