class AddColumnTo < ActiveRecord::Migration[6.1]
  def change
    add_column :specific_notifications, :readed, :boolean
    remove_column :notifications, :readed, :boolean
    
  end
end
