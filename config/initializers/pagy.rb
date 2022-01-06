require 'pagy/extras/searchkick'
Pagy::DEFAULT[:items] = 10        # items per page
Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links

Searchkick.extend Pagy::Searchkick