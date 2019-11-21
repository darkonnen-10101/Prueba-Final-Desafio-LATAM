class UsersController < ApplicationController
  # before_action :set_user, only: [:profile]

  load_and_authorize_resource

  def all
    @users = User.all
  end

  def profile
    @projects = @user.projects
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id)
  end



end
