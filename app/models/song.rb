class Song < ApplicationRecord
  has_many :song_composes_albums
  has_many(:albums, through: :song_composes_albums)
  has_and_belongs_to_many :playlists
  has_many :interactions, as: :interactable
  has_many :artist_perform_songs
  has_many :artists, through: :artist_perform_songs
  has_and_belongs_to_many :genres
  has_attached_file :song_file
  validates_attachment :song_file, content_type: { content_type: ["audio/mp3", "audio/mpeg", "audio/mp4"] }

  # 'class << self' allows inside methods to be called as Song.[method_name]. (Like a static method in java)
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

