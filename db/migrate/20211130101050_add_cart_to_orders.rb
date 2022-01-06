class AddCartToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cart, :boolean
  end
end
