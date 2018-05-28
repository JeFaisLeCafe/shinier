class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
