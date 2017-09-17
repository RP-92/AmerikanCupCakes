class AddDetailsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :cake_base_name, :string
    add_column :orders, :cake_filling_name, :string
    add_column :orders, :attendants, :integer
  end
end
