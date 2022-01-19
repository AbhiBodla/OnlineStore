class ProductService < ApplicationRecord

  searchkick match: :word_start, searchable: [:name, :desc]

    include Discard::Model
    has_many :orders, as: :orderable
    has_many :notifications, as: :notifiable, dependent: :destroy
    belongs_to :user
    validates :category_id, presence: true

    after_create :notification_for_product_service_added    
   
    # notification for adding product_service
    def notification_for_product_service_added
        title = I18n.t('product_service_title')
        content = I18n.t('product_service_content')
        notification_data = {"title": title, "content": content, "notifiable_type": "Order", "notifiable_id": id}
        user = User.all    
        Notification.notification_create(notification_data, user)         
      end
end
