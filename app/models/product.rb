class Product < ApplicationRecord

searchkick match: :word_start, searchable: [:name, :desc]

    include Discard::Model
    attr_accessor :remove_main_image
    has_many :orders, as: :orderable, dependent: :destroy
    has_many :notifications, as: :notifiable, dependent: :destroy
    has_many :product_variants, dependent: :destroy
    accepts_nested_attributes_for :product_variants
    belongs_to :user
    has_one_attached :main_image
    has_many_attached :other_images
    validates :category_id, presence: true
    belongs_to :category
    

    after_create :notification_for_product_added    

    def notification_for_product_added

        title = I18n.t('product_title')
        content = I18n.t('product_content')
        notification_data = {"title": title, "content": content, "notifiable_type": "Order","notifiable_id": id}
        user = User.select('id').where("id=#{user_id}")
      
        Notification.notification_create(notification_data, user) 
        
      end
 
    
end
