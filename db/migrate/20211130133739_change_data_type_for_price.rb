class ChangeDataTypeForPrice < ActiveRecord::Migration[6.1]
  def change

    change_table :services do |t|
      t.change :price, :integer
    end

  end
end
