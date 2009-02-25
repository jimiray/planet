# The methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def config_value(name)  
    config[name]
  end
  
  def render_sidebars
    render_component(:controller => 'sidebars/sidebar',
                     :action => 'display_plugins')
  end
  
  def render_sidebar(sidebar)
    begin
      render_component :controller => sidebar.sidebar_controller.component_name, 
        :action=>'index', :params => {:sidebar => sidebar,
                                      :contents => (@params[:contents])}
    rescue => e 
      content_tag :p, e.message, :class => 'error'
    end
  end
  
end
