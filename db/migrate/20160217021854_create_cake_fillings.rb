class CreateCakeFillings < ActiveRecord::Migration
  def change
    create_table :cake_fillings do |t|
      t.string :name

      t.timestamps
    end
  end
end
