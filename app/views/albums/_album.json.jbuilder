json.extract! album, :id, :name, :artist, :release, :image, :created_at, :updated_at
json.url album_url(album, format: :json)
