json.extract! service, :id, :name, :desc, :code, :time, :price, :created_at, :updated_at
json.url service_url(service, format: :json)
