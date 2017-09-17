class CreateCakeBases < ActiveRecord::Migration
  def change
    create_table :cake_bases do |t|
      t.string :name

      t.timestamps
    end
  end
end
