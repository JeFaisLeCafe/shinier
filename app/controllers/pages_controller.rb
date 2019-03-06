class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home, :questions]

  def home
  end

  def user_home
    @questions = Question.top_9_questions(current_user.disease)
  end

  def my_question
    @questions = current_user.questions.all
    @pages = @questions.page(params[:page]).per(5)
  end
end
