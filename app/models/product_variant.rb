class ProductVariant < ApplicationRecord
  include Discard::Model
  belongs_to :product
  has_many :orders, as: :ordered, dependent: :destroy
  validates_uniqueness_of :batch_no
  belongs_to :user
  has_one_attached :main_image
  has_many_attached :other_images
end
