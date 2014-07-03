json.array!(@reviews) do |review|
  json.extract! review, :name, :content, :rating, :product_id
  json.url review_url(review, format: :json)
end
