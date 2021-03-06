# ## Custom Deploy
# activate :deploy do |plugin|
#   plugin.deploy_method = :rsync

#   plugin.clean = true
#   plugin.build_before = true

#   plugin.host = "westonganger.com"
#   plugin.user = 'weston'

#   if ENV['GIT_BRANCH'].present?
#     plugin.path = "/usr/share/nginx/html/middleman_template/#{ENV['GIT_BRANCH']}/"
#   else
#     raise "Could not deploy. Please define ENV['GIT_BRANCH']"
#   end
# end

# ## Deploy to GitHub Pages
# set :relative_links, true ### "/about" becomes "../about/"
# activate :relative_assets
# set :build_dir, 'docs'
# activate :deploy do |deploy|
#   deploy.deploy_method = :git
#   deploy.branch        = 'production'
#   deploy.build_before  = true # always use --no-clean options
#   deploy.commit_message = "Deployed using #{Middleman::Deploy::PACKAGE} v#{Middleman::Deploy::VERSION}"
# end


# ## Deploy to Gitlab Pages
set :relative_links, true ### "/about" becomes "../about/"
activate :relative_assets
set :build_dir, 'public'
set :base_url, "/#{`basename $PWD`}"
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch        = 'production'
  deploy.build_before  = true # always use --no-clean options
  deploy.commit_message = "Deployed using #{Middleman::Deploy::PACKAGE} v#{Middleman::Deploy::VERSION}"
end
