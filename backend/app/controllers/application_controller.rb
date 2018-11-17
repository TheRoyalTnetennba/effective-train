class ApplicationController < ActionController::API
  helper_method :current_user, :logged_in?

  def current_user
    return nil unless auth_token
    @current_user ||= User.find_by(session_token: auth_token)
  end

  def login(user)
    user.reset_session_token
    @current_user = user
  end

  def logout
    current_user.reset_session_token
    @current_user = nil
  end

  def require_logged_in
    render json: {base: ["invalid credentials"]}, status: 401 unless current_user
  end

  def logged_in?
    !!current_user
	end
	
	def auth_token
		request.headers["Authorization"]
	end
end
