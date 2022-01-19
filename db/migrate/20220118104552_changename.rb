class Changename < ActiveRecord::Migration[6.1]
  def change
    rename_table :services, :product_services
    rename_column :orders, :ordered_id, :orderable_id
    rename_column :orders, :ordered_type, :orderable_type
    rename_column :notifications, :notification_of_id, :notifiable_id
    rename_column :notifications, :notification_of_type, :notifiable_type
  end
end
