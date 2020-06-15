# ## Custom Deploy
# activate :deploy do |plugin|
#   plugin.deploy_method = :rsync
#   plugin.host = "example.com"
#   plugin.path = "/usr/share/nginx/html/middleman_template"
#   plugin.user = 'weston'
#   plugin.clean = true
#   plugin.build_before = true
# end

## Deploy to GitHub Pages
activate :deploy do |deploy|
  set :relative_links, true ### "/about" becomes "../about/"
  activate :relative_assets

  deploy.deploy_method = :git
  deploy.branch        = 'gh-pages'
  deploy.build_before  = true # always use --no-clean options
  deploy.commit_message = "Deployed using #{Middleman::Deploy::PACKAGE} v#{Middleman::Deploy::VERSION}"
end
