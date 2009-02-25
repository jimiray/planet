class Configuration < ConfigManager

  setting :planet_name, :string, 'My Planet Site'
  setting :footer, :string, 'All material copyright their respective owners'
  setting :num_bounces, :int, 50
  setting :theme, :string, 'default'
  
end

def config
  $config ||= Configuration.new
end
