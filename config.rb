require 'slim'

require 'lib/constants'
require 'lib/favicon_map'
require 'lib/blog'
require 'lib/search'
require 'lib/proxy_pages'
require 'lib/layout_map'

FLAGS = {
  dev_speedup: false
}

set :url_root, 'https://22re_tech.westonganger.com'
set :layout, "page" # other page layouts can be stated in lib/layout_map.rb
set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'

Time.zone = "America/Vancouver"

activate :disqus do |plugin|
  plugin.shortname = '22re-tech-westonganger-com'
end

# activate :robots, sitemap: "#{config[:url_root]}/sitemap.xml", rules: [
#   { user_agent: '*', allow: %w[/] } # Allow all
# ] 

activate :search_engine_sitemap, default_priority: 0.5, default_change_frequency: "weekly"
activate :spellcheck, dontfail: 1, ignored_exts: ['.css', '.scss','.js'], allow: ['IncorrectWordHere']#, page: "blog/*"
activate :directory_indexes ### pretty urls
activate :alias
activate :protect_emails
activate :middleman_simple_thumbnailer ### = image_tag image, resize_to: '50x50'

activate :autoprefixer do |prefix|
  prefix.browsers = "defaults"
end

activate :sprockets do |plugin|
  plugin.expose_middleman_helpers = true
end

if defined? RailsAssets
  RailsAssets.load_paths.each do |path|
    sprockets.append_path path
  end
end

configure :development do
  config[:protocol] = "http://"
  config[:host] = "0.0.0.0"
  config[:port] = 4567
end

# BUILD CONFIG: https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
  config[:protocol] = url_root.split(":").first
  config[:host] = url_root.split("//").last
  config[:port] = 80
  #config[:http_prefix] = "/22re_tech"

  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :gzip
  activate :minify_html

  unless FLAGS[:dev_speedup]
    activate :imageoptim, pngout: false, svgo: false

    activate :favicon_maker, icons: FAVICON_MAP
  end
end

activate :deploy do |plugin|
  plugin.deploy_method = :rsync
  plugin.host = "westonganger.com"
  plugin.path = "/usr/share/nginx/html/22re_tech"
  plugin.user = 'weston'
  plugin.clean = true
  plugin.build_before = true
end
