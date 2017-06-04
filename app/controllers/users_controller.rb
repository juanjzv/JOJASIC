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
    @user = User.includes(:interactions).find(params[:id])
    # @likes = @user.interactions.where(kind: :like)
    @liked_songs = []
    @liked_albums = []
    @liked_playlists = []
    @liked_artists = []
    @playlists = @user.playlists
    @user.interactions.each do |i|
      @liked_songs << i if i.kind == :like and i.interactable_type == :song
      @liked_songs << i if i.kind == :like and i.interactable_type == :song
      @liked_songs << i if i.kind == :like and i.interactable_type == :song
      @liked_songs << i if i.kind == :like and i.interactable_type == :song
    end

  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
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
      params.require(:user).permit(:username, :email, :avatar)
    end
end
