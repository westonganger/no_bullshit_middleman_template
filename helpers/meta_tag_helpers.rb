module MetaTagsHelpers

  def meta_tag_url
    host_url(current_page.url)
  end

end
