class PostsController < ApplicationController 
  
  def index
   @posts = Post.desc.paginate :page => params[:page]
   respond_to do |format|
     format.html {}
     format.rss {}
     format.atom {}
    end
  end

  def search
    @pages = Paginator.new self, Post.search(@params['q'], 99999999, 0).length, 20, @params[:page]
    @posts = Post.search(@params['q'], @pages.current.to_sql[0], @pages.current.to_sql[1])
    render :action => "index"
  end
  
  def live_search
    @search = @params[:q]
    @posts = Post.search(@params[:q], 10, 0)
    render :layout=>false
  end
  
  def feed
    @feed  = Feed.find(@params['id'])
    @pages, @posts = paginate :post, :per_page=>20, :conditions=>["feed_id=?",@params['id']], :order_by=>"created_at DESC"
  end
  
  private
  
  #def calc_offset
  #  @page = 20 * (@params['page'].to_i || 0)
  #end
  
  #def colorize_search
  #  return unless @params['q']
  #  for word in @params['q'].split(' ')
  #    @response.body.gsub!(/\b(#{word})\b/, '<strong>\0</strong>' )
  #  end    
  #end
  
end
