class Page < ActiveRecord::Base
  
  validates_presence_of :location, :title
  validates_uniqueness_of :location, :message=>"already exists"

end
