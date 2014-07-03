json.array!(@comments) do |comment|
  json.extract! comment, :author, :content, :image, :rating, :blog_id
  json.url comment_url(comment, format: :json)
end
