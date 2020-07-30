class LoginsController < ApplicationController

  def new
    if session[:current_user].present?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(email: user_params[:email])
    if user.present? && user.password_digest == user_params[:password_digest]
      session[:current_user] = user
      redirect_to root_path
    else
      @user = User.new
      render :new, alert: "Something is wrong. Make sure you are entering the right credentials"
    end
  end

  def destroy
    if session[:current_user].present?
      session.delete(:current_user)
      redirect_to new_logins_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
