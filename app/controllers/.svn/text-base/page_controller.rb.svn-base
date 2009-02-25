class PageController < ApplicationController
  
  def view
    unless @page = Page.find_by_location(@params[:id])
      raise ActiveRecord::RecordNotFound
    end
  end
  
end
