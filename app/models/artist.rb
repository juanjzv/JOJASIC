class Artist < ApplicationRecord
  has_and_belongs_to_many (:genres)
  has_many :interactions, as: :interactable
  has_many :artist_perform_songs
  has_many :songs, through: :artist_perform_songs
  has_and_belongs_to_many :albums

  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

end
