module SessionsHelper

  # Logs in successful user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the correct User (if any)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Positve input user- false if otherwise
  def logged_in?
    !current_user.nil?
  end

  # Logs a "current_user" out.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
