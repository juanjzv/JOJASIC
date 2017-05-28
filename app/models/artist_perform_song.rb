class ArtistPerformSong < ApplicationRecord
  belongs_to :artist
  belongs_to :song
  enum role[:main, :invited]
end
