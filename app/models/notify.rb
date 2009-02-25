class Notify < ActionMailer::Base


  def suggestion(feed)
    @subject = "Planet Feed Suggestion"
    @from = "admin@planetrubyonrails.org"
    @to = User.find(:all).collect {|u| [ u.email] }
    @body['feed'] = feed
  end

  def feed_error(feeds)
    @subject = "Planet Feed Errors"
    @from = "admin@planetrubyonrails.org"
    @to = User.find(:all).collect {|u| [ u.email] }
    @body['feeds'] = feeds
  end

end
