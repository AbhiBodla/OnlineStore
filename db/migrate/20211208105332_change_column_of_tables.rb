class ChangeColumnOfTables < ActiveRecord::Migration[6.1]
  def down 
   
    change_column :services, :time, :integer
    add_column :orders, :end_time, :time
    add_column :services, :start_time, :time
    add_column :services, :end_time, :time
    rename_column :services, :time, :duration
    add_column :orders,:start_time, :time
  end
end
