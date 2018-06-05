class Answer < ApplicationRecord
  searchkick language: "english", match: :word_start
  belongs_to :question
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  acts_as_votable
  after_create :create_notifications

  def create_notifications
    answer_user = self.question.answers.map(&:user).uniq
    answer_user.each do |recipient|
      Notification.create(recipient: recipient, actor: self.user,
        action: 'posted', notifiable: self)
    end
  end

  def top_answer
    question = self.question
    question_sorted = Answer.where(question: question).sort_by do |answer|
      -answer.get_upvotes.size
    end
    question_sorted.first == self
  end
end
