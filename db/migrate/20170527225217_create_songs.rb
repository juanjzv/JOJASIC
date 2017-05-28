class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name, limit: 50, null: false
      t.integer :lenght, null: false
      t.date :release
      t.timestamps
    end
  end
end
