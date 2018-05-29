class AnswersController < ApplicationController

  def index
    # should implement the way how the answer will be display
  end


  # we ll handle the upvote later

  def new
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question
    if @answer.save
      #redirect somewhere
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    if @answer.save
      #redirect somewhere
    else
      render :new
    end
  end

  def destroy
    @answer = Answer.find(params[:id].to_i)
    @answer.destroy
    redirect_to question_answers_path
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end

end
