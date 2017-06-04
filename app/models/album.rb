class Album < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :song_composes_albums
  has_many(:songs, through: :song_composes_albums)
  has_many :interactions, as: :interactable
  belongs_to  :artist

  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  # 'class << self' allows inside methods to be called as Son.[method_name].
  class << self
    def in_order
      order(created_at: :asc)
    end

    def recent(n)
      in_order.endmost(n)
    end

    def endmost(n)
      all.only(:order).from(all.reverse_order.limit(n), table_name)
    end
  end
end
