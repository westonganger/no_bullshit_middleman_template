## Custom Deploy
activate :deploy do |plugin|
  plugin.deploy_method = :rsync

  plugin.clean = true
  plugin.build_before = true

  plugin.host = "westonganger.com"
  plugin.user = 'weston'

  case ENV['GIT_BRANCH']
  when 'master'
    plugin.path = "/usr/share/nginx/html/middleman_template/test/"
  when 'production'
    plugin.path = "/usr/share/nginx/html/middleman_template/production/"
  else
    raise "Could not deploy. Please define ENV['GIT_BRANCH']"
  end
end

# ## Deploy to GitHub Pages
# activate :deploy do |deploy|
#   set :relative_links, true ### "/about" becomes "../about/"
#   activate :relative_assets

#   deploy.deploy_method = :git
#   deploy.branch        = 'gh-pages'
#   deploy.build_before  = true # always use --no-clean options
#   deploy.commit_message = "Deployed using #{Middleman::Deploy::PACKAGE} v#{Middleman::Deploy::VERSION}"
# end
