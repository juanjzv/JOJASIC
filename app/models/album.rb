class Album < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many(:songs, through: :song_composes_albums)
  has_many :interactions, as: :interactable
  belongs_to  :artist
end
