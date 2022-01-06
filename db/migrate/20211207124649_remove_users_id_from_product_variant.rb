class RemoveUsersIdFromProductVariant < ActiveRecord::Migration[6.1]
  def change
    remove_column :product_variants, :users_id, :integer
  end
end
