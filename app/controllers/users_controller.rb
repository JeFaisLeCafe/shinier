class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :update, :destroy ]

  def show
  end

  def article_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
