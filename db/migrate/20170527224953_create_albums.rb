class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name, limit: 50
      t.references :artist, foreign_key: true, null:false
      t.timestamps
    end
  end
end
