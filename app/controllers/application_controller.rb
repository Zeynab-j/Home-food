class ApplicationController < ActionController::Base

  def authenticate_user!
    if session[:current_user].present?
      session[:current_user]
    else
      redirect_to new_logins_path
    end
  end
  helper_method :authenticate_user!
end
