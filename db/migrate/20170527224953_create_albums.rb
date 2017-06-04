class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name, limit: 50
      t.references :artist, foreign_key: { on_update: :cascade, on_delete: :cascade}, null:false
      t.timestamps
    end
  end
end
