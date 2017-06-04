class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized, only: [:edit, :update, :destroy, :add_song]
  require 'json'
  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  # POST /playlists/1/songs/1
  def add_song
    authorize @playlist
    @song = Song.find(params[:id])
    respond_to do |format|
      if not @song.nil? and not @playlist.has_song?(@song)
        @playlist.songs << @song
        format.html { redirect_to @playlist, notice: 'Se agregó la canción a la playlist' }
        format.json { render json: {message: 'Cancion agregada', status: :ok} }
      else
        format.html { render :edit }
        format.json { render json: {message: 'No se agrego cancion'} }
      end
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new()
    unless current_user.admin?
      @playlist.user_id = current_user
    end
  end

  # GET /playlists/1/edit
  def edit
    authorize @playlist
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    unless current_user.admin?
      @playlist.user_id = current_user.id
    end
    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    authorize @playlist
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    authorize @playlist
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name, :user_id)
    end
end
