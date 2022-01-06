class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :content
      t.boolean :readed
      t.references :notification_of, polymorphic: true, null: false

      t.timestamps
    end
  end
end
