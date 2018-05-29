class Question < ApplicationRecord
  belongs_to :disease
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable



# if we have more than 5 upvotes in the answers of the question, it will mark as useful
  def useful?
    answers = []
    Question.last.answers.each do |answer|
      answers << answer.get_upvotes.size
    end
    if answers.sum > 5
      return true
    else
      return false
    end
  end

end
