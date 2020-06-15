### https://github.com/westonganger/middleman-search

activate :search do |plugin|
  plugin.resources = ['posts/']
  plugin.index_path = "search.json" #relative path
  plugin.fields = {
    title:   {boost: 100, store: true, required: true},
    content: {boost: 50},
    url:     {index: false, store: true}
  }

  # plugin.before_index = Proc.new do |to_index, to_store, resource|
  #   if ['Articles Tagged', 'Posts by Tag'].any?{|ss| ss == resource.data.title}
  #     throw(:skip)
  #   end

  #   to_store[:group] = resource.path.split('/').first
  # end
end
