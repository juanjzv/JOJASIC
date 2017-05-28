class Genre < ApplicationRecord
  has_and_belongs_to_many (:artists)
  has_and_belongs_to_many (:albums)
  has_many :interactions, as: :interactable
  has_and_belongs_to_many :songs
end
