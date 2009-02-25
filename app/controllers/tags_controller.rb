class TagsController < ApplicationController
  
  def index
    @tags = Post.tag_count
  end
  
  def view
    @posts = Post.find_tagged_with( :all => @params[:id], :separator => ' ', :order=>"posts.created_at DESC")
  end
  
end
