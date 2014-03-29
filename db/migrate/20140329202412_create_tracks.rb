class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :ismn_num
      t.integer :total_plays

      t.timestamps
    end
  end
end
