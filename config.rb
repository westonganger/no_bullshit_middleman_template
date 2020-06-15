require 'slim'

instance_eval do
  File.read 'config/blog.rb'
  File.read 'config/search.rb'
  File.read 'config/proxy_pages.rb'
  File.read 'config/deploy.rb'
end

FLAGS = {
  dev_speedup: false
}

URL = @app.data.site.url

set :url_root, URL
set :layout, "page"
set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'

activate :directory_indexes ### pretty urls, "/" instead of "/index.html"
activate :alias
#activate :protect_emails

activate :inline_svg # = inline_svg 'example.svg'
activate :middleman_simple_thumbnailer, cache_dir: '.tmp/simple-thumbnailer-cache' # = image_tag image, resize_to: '50x50'

activate :disqus do |plugin|
  plugin.shortname = URL.split(':').last
end

activate :external_pipeline,
  name: :webpack,
  command: (build? ? 'yarn run build' : 'yarn run start'),
  source: '.tmp/dist',
  latency: 1

activate :sitemap, gzip: build?, hostname: URL

activate :sitemap_ping do |config|
  config.host = URL
  #config.sitemap_file = 'sitemap.xml'
  #config.ping_google = true
  #config.ping_bing true
  config.after_build = false
end

activate :robots, sitemap: "#{URL}/sitemap.xml", rules: [
  { user_agent: '*', allow: %w(/) },
]

configure :development do
  config[:protocol] = "http://"
  config[:host] = "0.0.0.0"
  config[:port] = 4567
end

# BUILD CONFIG: https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
  config[:protocol] = URL.split(":").first
  config[:host] = URL.split("//").last
  config[:port] = 80
  #config[:http_prefix] = "/blog"

  activate :asset_hash
  activate :gzip
  activate :minify_css
  activate :minify_javascript
  activate :minify_html, remove_input_attributes: false

  unless FLAGS[:dev_speedup]
    activate :imageoptim, pngout: false, svgo: false

    ### List from https://github.com/flexbox/codeless/blob/master/config.rb
    activate :favicon_maker, icons: {
      "assets/images/_favicon_template.png" => [
        { icon: 'chrome-touch-icon-192x192.png' },
        { icon: 'apple-touch-icon.png', size: '152x152' },
        { icon: 'ms-touch-icon-144x144-precomposed.png', size: '144x144' },
        { icon: 'favicon-196x196.png' },
        { icon: 'favicon-160x160.png' },
        { icon: 'favicon-96x96.png' },
        { icon: 'favicon-32x32.png' },
        { icon: 'favicon-16x16.png' },
        { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
      ]
    }
  end
end

## Per-page layout changes - https://middlemanapp.com/basics/layouts/ 
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
