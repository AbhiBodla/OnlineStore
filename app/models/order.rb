class Order < ApplicationRecord
   
  
  belongs_to :ordered, polymorphic: true
  belongs_to :user

  after_create :notification_for_order_placed 
  before_commit :decrease_product_variant_quantity

  # notification for order placed
  def notification_for_order_placed

    title = I18n.t('order_title')
    content = "New Order PLaced for #{ordered_type} by #{user.email}"
    notification_data = {"title": title, "content": content, "notification_of_type": "Order","notification_of_id": id}
    user = User.select('id').where("id=5 OR id=#{user_id}")
    Notification.notification_create(notification_data, user)

    # Broadcasting Notification
    ActionCable.server.broadcast("room_channel", {content: "New order placed for #{ordered_type}", for_user: "admin" })

  end    

  # decreasing quantity after order placed
  def decrease_product_variant_quantity 
 
    if Order.where(cart == "false" && ordered_type == "ProductVariant") 
      product = ProductVariant.find(ordered_id) 
     if  qty != nil 
      if (qty > product.quantity)
         content = "you are exceeding stock limit"          
      else             
        product.update(quantity: (product.quantity - qty))
      end
    end 
    end

end
end
