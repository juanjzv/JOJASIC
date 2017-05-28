class CreateGenresAlbumsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :albums do |t|
      t.references :genre, index: true, foreign_key: true
      t.references :album, index: true, foreign_key: true
      t.index [:genre_id, :album_id], unique: true
    end
  end
end