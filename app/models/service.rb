class Service < ApplicationRecord

  searchkick match: :word_start, searchable: [:name, :desc]

    include Discard::Model
    has_many :orders, as: :ordered
    has_many :notifications, as: :notification_of, dependent: :destroy
    belongs_to :user
    validates :category_id, presence: true

    after_create :notification_for_service_added    
   
    # notification for adding service
    def notification_for_service_added
        title = I18n.t('service_title')
        content = I18n.t('service_content')
        notification_data = {"title": title, "content": content, "notification_of_type": "Order", "notification_of_id": id}
        user = User.select('id').where("id=#{user_id}")    
        Notification.notification_create(notification_data, user)         
      end
end
