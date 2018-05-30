class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def user_home

    @questions = Question.top_10_questions(current_user.disease)
  end


end
