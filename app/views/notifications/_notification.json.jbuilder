json.extract! notification, :id, :title, :content, :readed, :notification_of_id, :notification_of_type, :created_at, :updated_at
json.url notification_url(notification, format: :json)
