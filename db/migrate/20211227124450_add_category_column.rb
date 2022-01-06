class AddCategoryColumn < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :category, null: false, foreign_key: true
    add_reference :products, :category, null: false, foreign_key: true
  end
end
