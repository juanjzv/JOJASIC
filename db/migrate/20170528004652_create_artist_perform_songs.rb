class CreateArtistPerformSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_perform_songs do |t|
      t.references :artist, foreign_key: { on_update: :cascade, on_delete: :cascade}, null: false
      t.references :song, foreign_key: { on_update: :cascade, on_delete: :cascade}, null: false
      t.integer :role
      t.index [:artist_id, :song_id], unique: true
      t.timestamps
    end
  end
end
