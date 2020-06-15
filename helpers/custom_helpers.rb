module CustomHelpers
  def root_url
    [config[:protocol], config[:host], (":#{config[:port]}" if config[:port].to_i != 80)].compact.join('')
  end

  def absolute_url(path)
    root_url + path 
  end

  def image_url(path)
    root_url + image_path(path)
  end

  def categories
    blog.articles.map{|x| x.data.category}.uniq.compact
  end
end
