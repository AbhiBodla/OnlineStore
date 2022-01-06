class CreateHaircuts < ActiveRecord::Migration[6.1]
  def change
    create_table :haircuts do |t|

      t.timestamps
    end
  end
end
