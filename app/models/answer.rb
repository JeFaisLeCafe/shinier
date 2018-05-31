class Answer < ApplicationRecord
  searchkick language: "english", match: :word_start
  belongs_to :question
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable
end
