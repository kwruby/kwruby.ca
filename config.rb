###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

helpers do
  # copied from https://forum.middlemanapp.com/t/getting-the-current-route-or-uri/994/4
  def nav_link(name, url, options={})
    options = {
      class: "",
      active_if: url,
      page: current_page.url,
    }.update options
    active_url = options.delete(:active_if)
    active = Regexp === active_url ? current_page.url =~ active_url : current_page.url == active_url
    options[:class] += " active" if active

    link_to name, url, options
  end

  # copied from https://cobwwweb.com/render-inline-svg-rails-middleman
  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :gzip
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :sprockets

  activate :favicon_maker, icons: {
    'logo/current.png' => [
      { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' }
    ]
  }

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
#  deploy.method       = :rsync
#  deploy.host         = 'kwruby.ca'
#  deploy.path         = '/var/www/kwruby.ca'
  deploy.build_before = true
  deploy.clean        = true
end

with_layout :wiki do
  page '/wiki/*'
end

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
               autolink: true,
               with_toc_data: true,
               tables: true

activate :syntax
set :haml, ugly: true

activate :directory_indexes
set :haml, ugly: true
