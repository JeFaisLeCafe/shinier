class QuestionsController < ApplicationController

  def index
    #should list all the unanswered question
    @questions = policy_scope(Question)
    #@questions = @questions.search params[:query], misspellings: {edit_distance: 2}
    @questions = if params[:query].present?
      Question.search(params[:query])
    else
      Question.all
    end
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
    @question = Question.find(params[:id])
    authorize @question
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

  def autocomplete
    authorize Question.new

    questions = Question.search(params[:query], {
      fields: ["title^5", "body"],
      match: :word_start,
      limit: 10,
      misspellings: {below: 2}
    })
    render json: questions.map { |question| render_to_string( partial: 'questions/autocomplete', locals: { question: question }) }
  end

  # def number_votes
  #   @question = Question.find(params[:id])
  #   answers = []
  #   @question.answers.each do |answer|
  #     answers << answer.get_upvotes.size
  #   end
  #   return answers.sum
  # end

  #   def useful?(question)
  #     @question = Question.find(params[:id])
  #     answers_sum = number_votes(question)
  #   if answers_sum > 5
  #     return true
  #   else
  #     return false
  #   end
  # end

  private

  def question_params
    params.require(:question).permit(:title, :body, :disease_id, :user_id, :answered, :query)
  end

end
