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

## Configuration

The main config is located at `config.rb`

The following additional configuration files are located in the `config/` folder:

- `config/blog.rb` (middleman-blog configuration)
- `config/deploy.rb` (deployment configuration)
- `config.proxy_pages.rb` (custom redirects)
- `config.search.rb` (search configuration)

## Setup / Installation / Development

- bin/setup
- bundle exec middleman server

## Gitlab Pages Deployment

- https://docs.gitlab.com/ee/user/project/pages/custom_domains_ssl_tls_certification/
- Configure settings in config/deploy.rb, by default deploys to Gitlab pages
- `bin/deploy.sh` OR use provided Gitlab job

## Credits

Created and maintained by Weston Ganger - [@westonganger](https://github.com/westonganger)
