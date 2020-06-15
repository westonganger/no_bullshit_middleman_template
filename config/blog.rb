Time.zone = @app.data.site.timezone

activate :blog do |plugin|
  plugin.name = "blog"
  plugin.prefix = "blog"
  plugin.layout = "post"
  #plugin.paginate = true
  #plugin.summary_separator = /SPLIT_SUMMARY_BEFORE_THIS/
  plugin.sources = "posts/{title}.html"
  plugin.permalink = "{category}/{title}"
  #plugin.sources = "posts/{category}/{year}-{month}-{day}-{title}.html"
  #plugin.permalink = "{category}/{year}/{month}/{day}/{title}.html"
  
  #plugin.custom_collections = {
  #  category: {
  #    link: '/categories/{category}.html',
  #    template: '/category_index.html'
  #  }
  #}
end

activate :similar ### Ex. current_article.similar_articles.first(5)

### Multiple blogs
#activate :blog do |plugin|
#  plugin.name = "blog2"
#end
