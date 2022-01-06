json.extract! order, :id, :ordered_id, :ordered_type, :total_amount, :created_at, :updated_at
json.url order_url(order, format: :json)
