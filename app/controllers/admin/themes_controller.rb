class Admin::ThemesController < Admin::BaseController

  def index
    @themes = Theme.find_all
    logger.info("Theme current path is #{Theme.name}}")
    #@active = Theme.current
  end
  
  def preview
    send_file "#{RAILS_ROOT}/themes/#{params[:theme]}/preview.png", :type => 'image/png', :disposition => 'inline', :stream => false
  end
  
  def switchto
    setting = (Setting.find_by_name('theme') or Setting.new("name" => 'theme'))
    setting.value = params[:theme]
    setting.save
    redirect_to :action => 'index'
  end
  
end
