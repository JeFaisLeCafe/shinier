class QuestionsController < ApplicationController

  def index
    #should list all the unanswered question
  end

  def new
    @disease = Disease.find(params[:disease_id])
    @question = Question.new
    @user = current_user
  end

  def create
    @disease = Disease.find(params[:disease_id])
    @question = Question.new(question_params)
    @question.disease = @disease
    @question.user = current_user
    if @question.save
      #redirect somewhere
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    @disease = Disease.find(params[:disease_id])
  end

  def update
    @question = Question.find(params[:id])
    @disease = Disease.find(params[:disease_id])
    @question.update(question_params)
    if @question.save
      #redirect somewhere
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    # redirect to the index
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :disease_id, :user_id, :answered)
  end

end
