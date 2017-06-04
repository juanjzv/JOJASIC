class AlbumPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @album = model
  end

  def can_do?
    @current_user.admin?
  end
end