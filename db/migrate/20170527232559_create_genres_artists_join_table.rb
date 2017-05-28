class CreateGenresArtistsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :artists do |t|
      t.references :genre, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true
      t.index [:genre_id, :artist_id], unique: true
    end
  end
end
