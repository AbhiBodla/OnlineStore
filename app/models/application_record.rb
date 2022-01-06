class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  extend Pagy::Searchkick
end
