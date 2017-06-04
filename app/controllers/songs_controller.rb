class SongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  # GET /songs
  # GET /songs.json
  def index
    authorize Song, :can_do?
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    check_admin
  end

  # GET /songs/new
  def new
    @song = Song.new
    check_admin
  end

  # GET /songs/1/edit
  def edit
    check_admin
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    check_admin
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    check_admin
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    check_admin
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :lenght, :release, :song_file)
    end

    def check_admin
      authorize @song, :can_do?
    end
end
