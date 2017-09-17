class AddAttachmentAvatarToEventTypes < ActiveRecord::Migration
  def self.up
    change_table :event_types do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :event_types, :avatar
  end
end
