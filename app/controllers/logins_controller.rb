class LoginsController < ApplicationController
  before_action :get_user_with_email, only: [:create]

  def new
    if session[:current_user].present?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create

    if @user.present? && @user.password_digest == user_params[:password_digest]
      session[:current_user] = @user
      redirect_to root_path
    else
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

  def get_user_with_email
    @user = User.find_by(email: user_params[:email])
  end
end
