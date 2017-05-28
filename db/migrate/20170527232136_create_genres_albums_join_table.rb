class CreateGenresAlbumsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :albums do |t|
      t.index :genre_id
      t.index :album_id
    end
  end
end