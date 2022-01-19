class Category < ApplicationRecord
    has_one :product
    enum category_of: {
        product: 0,
        product_service: 1
    }
end
