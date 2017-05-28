class Song < ApplicationRecord
  has_many(:albums, through: :song_composes_albums)
  has_and_belongs_to_many :playlists
  has_many :interactions, as: :interactable
  has_many :artists, through: :artist_perform_songs
  has_and_belongs_to_many :genres

end
