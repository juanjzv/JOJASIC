class CreateSongComposesAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :song_composes_albums do |t|
      t.references :song, foreign_key: true
      t.references :album, foreign_key: true
      t.index [:song_id, :album_id], unique: true
      t.integer :track_number
      t.timestamps
    end
  end
end
