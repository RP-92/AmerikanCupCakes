class AddKeysToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :cake_base_id, :integer
    add_column :orders, :cake_filling_id, :integer
  end
end
