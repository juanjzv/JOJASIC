class CreateGenresArtistsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :artists do |t|
      t.references :genre, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.references :artist, index: true, foreign_key: { on_update: :cascade, on_delete: :cascade}
      t.index [:genre_id, :artist_id], unique: true
    end
  end
end
