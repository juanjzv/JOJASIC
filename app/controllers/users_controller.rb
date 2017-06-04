class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize User
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])#.includes(:interactions)
    # @likes = @user.interactions.where(kind: :like)
    @playlists = @user.playlists
    @liked_songs = @user.interactions.where(kind: :like, interactable_type: :song)
    @liked_albums = @user.interactions.where(kind: :like, interactable_type: :album)
    @liked_playlists = @user.interactions.where(kind: :like, interactable_type: :playlist)
    @liked_artist = @user.interactions.where(kind: :like, interactable_type: :artist)

  end

  # GET /users/1/edit
  def edit

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    athorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
