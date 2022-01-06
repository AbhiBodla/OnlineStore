json.extract! wishlist, :id, :user_id, :product_variant_id, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
