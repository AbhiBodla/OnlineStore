class AddImageToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image_name, :string 
  end
end
