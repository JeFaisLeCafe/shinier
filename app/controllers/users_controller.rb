class UsersController < ApplicationController



  def article_params
    params.require(:user).permit(:photo)
  end
end
