class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :product_variant
end
