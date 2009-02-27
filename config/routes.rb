ActionController::Routing::Routes.draw do |map|

  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.resources :users, :has_one => [:password, :confirmation]
  map.resource :session
  map.resources :passwords
  
  map.namespace :admin do |admin|
    admin.resources :feeds, :collection => {:search => :post}
    admin.resources :users
  end
  
  # Add your own custom routes here.
  # The priority is based upon order of creation: first created -> highest priority.
  
  map.connect '', :controller=>"show", :action=>"index"
  map.admin 'admin', :controller=>"admin/feeds", :action=>"index"
  map.connect 'suggest/', :controller=>"feed", :action=>"suggest"
  map.connect 'contact/', :controller=>"contact", :action=>"index"
  map.connect '/rss20.xml', :controller=>"xml", :action=>"rss"
  map.connect '/feedburner', :controller=>"xml", :action=>"rss"

  # Here's a sample route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.root :controller => 'show', :action => 'index'
  
  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
