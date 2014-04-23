class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :label
      t.integer :ismn_num
      t.integer :total_plays
      t.integer :playlist_id

      t.timestamps
    end
  end
end
