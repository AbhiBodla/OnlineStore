class DropTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :role_notifications
  end
end
