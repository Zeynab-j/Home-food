class RegistrationsController < ApplicationController
  before_action :get_user, only:[:new]
  def new;end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end

  def get_user
    @user = User.new
  end
end
