class Answer < ApplicationRecord
  searchkick
  belongs_to :question
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable
end
