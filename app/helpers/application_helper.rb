module ApplicationHelper
  def current_action_is(controller, action)
    if params[:controller]==controller and params[:action] == action
      return true
    else
      return false
    end
  end
end
