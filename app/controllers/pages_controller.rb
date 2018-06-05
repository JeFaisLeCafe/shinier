class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def user_home
    @questions = Question.top_9_questions(current_user.disease)
  end

  def my_question
    @questions = current_user.questions.all
  end

end
