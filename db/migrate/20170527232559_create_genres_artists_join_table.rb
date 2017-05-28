class CreateGenresArtistsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :artists do |t|
      t.index :genre_id
      t.index :artist_id
    end
  end
end
