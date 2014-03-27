class AddAttachmentPhotoToPlaylists < ActiveRecord::Migration
  def self.up
    change_table :playlists do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :playlists, :photo
  end
end
