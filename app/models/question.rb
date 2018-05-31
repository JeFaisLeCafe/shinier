class Question < ApplicationRecord
  searchkick language: "english", match: :word_start

  belongs_to :disease
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable


  def total_upvotes
    self.answers.pluck(:upvotes).sum
  end
# if we have more than 0 upvotes in the answers of the question, it will mark as useful
# je pars du principe que lon ne peut pas useful une question
# une question est useful si les reponses sont useful
# apres on peut imaginer un truc qui serait un indice de demande de reponse, my 2 cents

  def self.top_9_questions(disease)
    disease.questions.sort_by do |question|
      -question.total_upvotes
    end.take(9)
  end

  def number_resolved(user)
    count = 0
    user.questions.each do |question|
      count += 1 if question.answered
    end
  end

  def number_unresolved(user)
    user.questions.count - number_resolved(user)
  end


  def number_votes
   answers = []
    self.answers.each do |answer|
      answers << answer.get_upvotes.size
    end
    return upvote = answers.sum
  end

  def useful?
    if number_votes > 12 # il faudra changer le 0 cest juste pour que le test soit plus easy
      return true
    else
      return false
    end
  end
end
