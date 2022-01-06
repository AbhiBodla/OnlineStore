class CreateMassages < ActiveRecord::Migration[6.1]
  def change
    create_table :massages do |t|

      t.timestamps
    end
  end
end
