class Song < ApplicationRecord
  has_many :song_composes_albums
  has_many(:albums, through: :song_composes_albums)
  has_and_belongs_to_many :playlists
  has_many :interactions, as: :interactable
  has_many :artist_perform_songs
  has_many :artists, through: :artist_perform_songs
  has_and_belongs_to_many :genres

  # 'class << self' allows inside methods to be called as Son.[method_name].
  # So one can call Song.recent(5) and get the last 5 created songs
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

