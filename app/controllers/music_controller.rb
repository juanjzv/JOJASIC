class MusicController < ApplicationController
  before_action :authenticate_user!

  def discover
    p "new_songs"
    @new_songs = Song.recent(5).includes( :genres, albums: [:artist])
    @new_albums = Album.recent(5).includes(:artist)
  end

  def search
    @songs = Song.where("name LIKE ?", "%#{params[:query]}%").includes( :genres, albums: [:artist])
    @albums = Album.where("name LIKE ?", "%#{params[:query]}%").includes(:artist)
    @artists = Artist.where("name LIKE ?", "%#{params[:query]}%").includes(:genres)
  end

  def list
  end
end
