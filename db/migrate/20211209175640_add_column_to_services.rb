class AddColumnToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :date, :date
  end
end
