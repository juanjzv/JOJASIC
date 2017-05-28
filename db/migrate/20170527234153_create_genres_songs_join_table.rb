class CreateGenresSongsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :songs do |t|
      t.references :genre, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.index [:genre_id, :song_id], unique: true
    end
  end
end
