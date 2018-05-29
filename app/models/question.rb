class Question < ApplicationRecord
  searchkick language: "english", match: :word_start

  belongs_to :disease
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable

# if we have more than 0 upvotes in the answers of the question, it will mark as useful


  def number_votes
   answers = []
    self.answers.each do |answer|
      answers << answer.get_upvotes.size
    end
    return upvote = answers.sum
  end

  def useful?
    if number_votes > 0
      return true
    else
      return false
    end
  end
end
