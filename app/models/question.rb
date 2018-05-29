class Question < ApplicationRecord
  belongs_to :disease
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable
end
