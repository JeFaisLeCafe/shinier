class AnswersController < ApplicationController

  def index
    # should implement the way how the answer will be display
  end


  def new
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    authorize @answer
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question
    authorize @answer
    if @answer.save
      redirect_to question_answer_path(@question, @answer)
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    authorize @answer
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    authorize @answer
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    authorize @answer
    if @answer.save
      #redirect somewhere
    else
      render :new
    end
  end

  def destroy
    @answer = Answer.find(params[:id].to_i)
    authorize @answer
    @answer.destroy
    redirect_to question_answers_path
  end

  def upvote
    @answer = Answer.find(params[:id])
    authorize @answer
    @answer.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @answer = Answer.find(params[:id])
    authorize @answer
    @answer.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end

end
