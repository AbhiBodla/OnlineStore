class AddDiscarded < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :discarded_at, :datetime
    add_index :products, :discarded_at

    add_column :product_variants, :discarded_at, :datetime
    add_index :product_variants, :discarded_at

    add_column :services, :discarded_at, :datetime
    add_index :services, :discarded_at

    add_column :specific_notifications, :discarded_at, :datetime
    add_index :specific_notifications, :discarded_at
    
    add_column :notifications, :discarded_at, :datetime
    add_index :notifications, :discarded_at

    add_column :categories, :discarded_at, :datetime
    add_index :categories, :discarded_at
  end
end
