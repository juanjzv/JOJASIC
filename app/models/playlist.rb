class Playlist < ApplicationRecord
  has_and_belongs_to_many :songs
  has_many :interactions, as: :interactable
  belongs_to :user

  def has_song? song
    songs = self.songs
    songs.each do |s|
      return true if s == song
    end
  end

end
