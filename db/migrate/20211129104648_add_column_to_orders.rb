class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :tim, :integer
    add_column :orders, :qty, :integer
  end
end
