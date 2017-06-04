class CreatePlaylistsSongsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :playlists, :songs do |t|
      t.references :playlist, index:true, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.references :song, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.index [:playlist_id, :song_id], unique: true
    end
  end
end
