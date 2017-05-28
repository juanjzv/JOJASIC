class CreateGenresSongsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :songs do |t|
      t.index :genre_id
      t.index :song_id
    end
  end
end
