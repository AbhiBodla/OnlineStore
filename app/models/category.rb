class Category < ApplicationRecord
    has_one :product
    enum category_of: {
        product: 0,
        service: 1
    }
end
