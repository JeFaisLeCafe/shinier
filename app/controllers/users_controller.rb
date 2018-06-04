class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :update, :destroy, :edit ]

  def show
  end

  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    end
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:photo, :firstname, :location, :secu_nb, :mutuelle_nb, :my_doctor)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
