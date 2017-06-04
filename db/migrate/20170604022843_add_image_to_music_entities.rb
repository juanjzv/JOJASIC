class AddImageToMusicEntities < ActiveRecord::Migration[5.1]
  def change
    add_attachment :albums, :image
    add_attachment :artists, :image
  end
end
