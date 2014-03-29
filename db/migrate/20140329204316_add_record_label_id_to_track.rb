class AddRecordLabelIdToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :record_label_id, :integer
  end
end
