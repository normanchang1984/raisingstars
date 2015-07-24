class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def log_current_user
    if current_user
      Rails.logger.info "current_user_id: #{current_user.id}"
    end
  end

end
