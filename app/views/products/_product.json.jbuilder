json.extract! product, :id, :name, :code, :desc, :price, :qty, :created_at, :updated_at
json.url product_url(product, format: :json)
