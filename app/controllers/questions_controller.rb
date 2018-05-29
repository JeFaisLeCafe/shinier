class QuestionsController < ApplicationController

  def index
    #should list all the unanswered question
    @questions = Question.search(params[:query])
  end

  def new
    @user = current_user
    @disease = current_user.disease_id
    @question = Question.new
  end

  def create
    @disease = current_user.disease_id
    @question = Question.new(question_params)
    @question.disease = Disease.find(@disease)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
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
    # @disease = Disease.find(params[:disease_id])
    if params[:answered].present?
      @question.answered = params[:answered]
    else
      @question.update(question_params)
    end
    if @question.save
      redirect_to question_path(@question)
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

  def toggle_answered
    @question = Question.find(params[:question_id])
    @question.answered = !@question.answered
    if @question.save
      redirect_to question_path(@question)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :disease_id, :user_id, :answered, :query)
  end

end
