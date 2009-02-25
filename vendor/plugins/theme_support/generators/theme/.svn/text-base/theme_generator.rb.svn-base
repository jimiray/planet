class ThemeGenerator < Rails::Generator::NamedBase
     
   def manifest
      record do |m|
          # Theme folder(s)
          m.directory File.join( "themes", file_name )
          m.template 'about.markdown', File.join( 'themes', file_name, 'about.markdown' )
          m.file 'preview.png', File.join( 'themes', file_name, 'preview.png' )
       
          m.directory File.join( "themes", file_name, "stylesheets" )
          m.template "theme.css", File.join( "themes", file_name, "stylesheets", "#{file_name}.css" )

          m.directory File.join( "themes", file_name, "layouts" )
          m.template 'layout.rhtml', File.join( 'themes', file_name, 'layouts', 'default.rhtml' )
          m.template 'layout.liquid', File.join( 'themes', file_name, 'layouts', 'default.liquid' )

          m.directory File.join( "themes", file_name, "views" )
          m.directory File.join( "themes", file_name, "images" )
          m.directory File.join( "themes", file_name, "javascript" )
      end
   end
end