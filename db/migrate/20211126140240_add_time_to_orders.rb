class AddTimeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :time, :integer
  end
end
