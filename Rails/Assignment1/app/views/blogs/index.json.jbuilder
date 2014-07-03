json.array!(@blogs) do |blog|
  json.extract! blog, :title, :author, :date, :content
  json.url blog_url(blog, format: :json)
end
