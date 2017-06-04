class CreateGenresSongsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :songs do |t|
      t.references :genre, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.references :song, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.index [:genre_id, :song_id], unique: true
    end
  end
end
