class Question < ApplicationRecord
  searchkick language: "english", match: :word_start

  belongs_to :disease
  has_many :answers, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable
  acts_as_taggable

  def total_upvotes
    self.answers.pluck(:upvotes).sum
  end

  def self.top_9_questions(disease)
    disease.questions.sort_by do |question|
      -question.number_votes
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
    if number_votes > 0 # il faudra changer le 0 cest juste pour que le test soit plus easy
      return true
    else
      return false
    end
  end
end
