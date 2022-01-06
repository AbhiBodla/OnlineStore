class Notification < ApplicationRecord
  
  belongs_to :notification_of, polymorphic: true 
  has_many :specific_notifications

  

    def self.notification_create notification_data,user
      @notification = Notification.new(notification_data)
      if @notification.save
            specific_notification =[]
            user.each do |user_id|
            specific_notification.push(["#{@notification.id}","#{user_id.id}","0"])
          end
            columns = [:notification_id, :user_id, :readed]
            SpecificNotification.import columns, specific_notification
      end
    end 
end
