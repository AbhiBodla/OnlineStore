class CreateProductVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variants do |t|
      t.string :batch_no
      t.string :weight
      t.float :price
      t.integer :quantity
      t.date :expiry
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
