json.extract! product_service, :id, :name, :desc, :code, :time, :price, :created_at, :updated_at
json.url product_service_url(product_service, format: :json)
