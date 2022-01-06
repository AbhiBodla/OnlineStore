class RemoveColumnsFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :code, :string
    remove_column :products, :price, :integer
    remove_column :products, :qty, :integer
  end
end
