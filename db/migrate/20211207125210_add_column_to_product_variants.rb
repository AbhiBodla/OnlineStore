class AddColumnToProductVariants < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_variants, :user, null: false, foreign_key: true
    add_reference :services, :user, null: false, foreign_key: true
    add_reference :products, :user, null: false, foreign_key: true
  end
end
