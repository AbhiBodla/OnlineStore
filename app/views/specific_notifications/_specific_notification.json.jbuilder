json.extract! specific_notification, :id, :user_id, :notification_id, :created_at, :updated_at
json.url specific_notification_url(specific_notification, format: :json)
