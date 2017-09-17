class AddMinidescriptionToEventTypes < ActiveRecord::Migration
  def change
    add_column :event_types, :minidescription, :text
  end
end
