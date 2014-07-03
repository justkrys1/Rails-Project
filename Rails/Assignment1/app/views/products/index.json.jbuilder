json.array!(@products) do |product|
  json.extract! product, :name, :description, :qty, :price, :cost, :weight, :thumbnail, :fullsize
  json.url product_url(product, format: :json)
end
