class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.date :date
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
