class FeedsController < ApplicationController

  def list
    @feeds = Feed.find(:all, :conditions=>"approved=1", :order=>"title")
    render :layout => false
  end

  def suggest 
    @feed = Feed.new(@params['feed']);
    if @request.post? and @feed.save
      Notify.deliver_suggestion(@feed)
      flash['notice'] = "Thanks for suggesting a new feed"
      redirect_to :action=>"thanks"
    end
  end

  def thanks
  end
  
end
