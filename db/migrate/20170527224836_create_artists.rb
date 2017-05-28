class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name, limit: 50, null: false
      t.timestamps
    end
  end
end
