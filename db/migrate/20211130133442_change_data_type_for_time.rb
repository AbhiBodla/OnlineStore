class ChangeDataTypeForTime < ActiveRecord::Migration[6.1]
  def change


    change_table :services do |t|
      t.change :time, :integer
    end
  


  end
end
