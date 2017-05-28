class AddReleaseToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :release, :date
  end
end
