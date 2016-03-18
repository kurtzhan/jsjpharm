json.array!(@products) do |product|
  json.extract! product, :id, :name, :category_id, :order
  json.url product_url(product, format: :json)
end
