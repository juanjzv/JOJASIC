class AddSongFileColumnsToSongs < ActiveRecord::Migration[5.1]
  def change
    add_attachment :songs, :song_file
  end
end
