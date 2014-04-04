class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track
      t.integer :ismn_num
      t.integer :total_plays
      t.integer :album_id
      t.integer :artist_id
      t.integer :playlist_id
      t.integer :record_label_id

      t.timestamps
    end
  end
end
