class Playlist < ApplicationRecord
  has_and_belongs_to_many :songs
  has_many :interactions, as: :interactable
end
