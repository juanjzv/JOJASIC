class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /albums
  # GET /albums.json
  def index
    authorize Album, :can_do?
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    check_admin
  end

  # GET /albums/new
  def new
    @album = Album.new
    check_admin
  end

  # GET /albums/1/edit
  def edit
    check_admin
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    check_admin
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    check_admin
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    check_admin
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :artist_id, :release, :image)
    end

    def check_admin
      authorize @album, :can_do?
    end
end
