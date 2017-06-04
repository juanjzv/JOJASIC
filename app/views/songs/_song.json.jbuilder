json.extract! song, :id, :name, :lenght, :release, :song_file, :created_at, :updated_at
json.url song_url(song, format: :json)
