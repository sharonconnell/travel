class AddAttachmentPhotoToDestinations < ActiveRecord::Migration
  def self.up
    change_table :destinations do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :destinations, :photo
  end
end
