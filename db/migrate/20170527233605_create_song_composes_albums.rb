class CreateSongComposesAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :song_composes_albums do |t|
      t.references :song, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.references :album, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.index [:song_id, :album_id], unique: true
      t.integer :track_number
      t.timestamps
    end
  end
end
