class ArtistPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @artist = model
  end

  def can_do?
    @current_user.admin?
  end
end