json.array!(@editorials) do |editorial|
  json.extract! editorial, :title, :author, :date, :published, :content, :image
  json.url editorial_url(editorial, format: :json)
end
