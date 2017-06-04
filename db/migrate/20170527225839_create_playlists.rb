class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :name, null: false
      t.references :user, type: :string,
                   foreign_key: {primary_key: 'email', on_update: :cascade, on_delete: :cascade}, null: false
      t.timestamps
    end
  end
end
