class PlaylistPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @playlist = model
  end

  def edit?
    @current_user.admin? or @current_user == @playlist.user
  end

  def update?
    @current_user.admin? or @current_user == @playlist.user
  end

  def destroy?
    @current_user.admin? or @current_user == @playlist.user
  end

end