class Search < ApplicationRecord
    Searchkick.extend Pagy::Searchkick
end
