class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to login_path, alert: 'You must be logged in to do that' if Current.user.nil?
  end

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
