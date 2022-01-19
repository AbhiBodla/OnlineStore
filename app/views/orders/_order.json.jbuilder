json.extract! order, :id, :orderable_id, :orderable_type, :total_amount, :created_at, :updated_at
json.url order_url(order, format: :json)
