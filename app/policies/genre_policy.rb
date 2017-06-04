class GenrePolicy
  def initialize(current_user, model)
    @current_user = current_user
    @genre = model
  end

  def can_do?
    @current_user.admin?
  end
end