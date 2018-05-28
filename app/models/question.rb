class Question < ApplicationRecord
  belongs_to :disease
  has_many :answers
  belongs_to :user
end
