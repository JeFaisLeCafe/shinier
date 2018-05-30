class QuestionsController < ApplicationController

  before_action :set_question, only: [ :show, :update, :destroy ]

  def index
    #should list all the unanswered question
    @questions = policy_scope(Question)
    @questions = @questions.search params[:query], misspellings: {edit_distance: 2}
  end

  def new
    @user = current_user
    @disease = current_user.disease_id
    @question = Question.new
    authorize @question
  end

  def create
    @disease = current_user.disease_id
    @question = Question.new(question_params)
    @question.disease = Disease.find(@disease)
    @question.user = current_user
    authorize @question
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @question = Question.find(params[:id])
    @disease = Disease.find(params[:disease_id])
  end

  def update
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
    @question.destroy
    # redirect to the index
    redirect_to questions_path
  end

  def toggle_answered
    @question = Question.find(params[:question_id])
    authorize @question
    @question.answered = !@question.answered

    if @question.save
      redirect_to question_path(@question)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :disease_id, :user_id, :answered, :query)
  end

  def set_question
    @question = Question.find(params[:id])
    authorize @question
  end

end
