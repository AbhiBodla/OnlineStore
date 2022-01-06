class AddColumnToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :type, :string
    add_column :services, :masg_code, :string
    add_column :services, :facl_code, :string
  end
end
