# No Bulls**t Middleman Template

Template for efficient static website generation using Middleman

## Tools

- Ruby 2.7
- Middleman 5.0
- Slim
- Webpack, SCSS, Global jQuery, Turbolinks
- ImageOptim
- Disqus Commenting Integration
- Favicon Generation
- middleman-search
- middleman-blog

## Setup / Development

- bin/setup
- bundle exec middleman server

## Configuration

The main config is located at `config.rb`

The following additional configuration files are located in the `config/` folder:

- `config/blog.rb` (middleman-blog configuration)
- `config/deploy.rb` (deployment configuration)
- `config.proxy_pages.rb` (custom redirects)
- `config.search.rb` (search configuration)

## Deployment

- Configure settings in config/deploy.rb, by default deploys to Github pages
- bin/deploy

## Credits

Created and maintained by Weston Ganger - [@westonganger](https://github.com/westonganger)
