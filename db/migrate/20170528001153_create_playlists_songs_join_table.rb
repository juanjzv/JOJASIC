class CreatePlaylistsSongsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :playlists, :songs do |t|
      t.index :playlist_id
      t.index :song_id
    end
  end
end
