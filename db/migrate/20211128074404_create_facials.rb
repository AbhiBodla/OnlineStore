class CreateFacials < ActiveRecord::Migration[6.1]
  def change
    create_table :facials do |t|

      t.timestamps
    end
  end
end
