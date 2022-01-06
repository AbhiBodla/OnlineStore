class ChangeStartTimeInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :start_time, :time
  end
end
