class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :disease, optional: true
  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify

  validates :firstname, presence: true
  # validates :lastname, presence: true
  validates_format_of :email,:with => Devise::email_regexp
  validates :email, presence: true
  # validates :location, presence: true
  validates :secu_nb, format: { with: /\A([1-3])[\s\.\-]?([0-9]{2})[\s\.\-]?(0[0-9]|[2-35-9][0-9]|[14][0-2])[\s\.\-]?(0[1-9]|[1-8][0-9]|9[0-57-9]|2[ab])[\s\.\-]?(00[1-9]|0[1-9][0-9]|[1-8][0-9]{2}|9[0-8][0-9]|990)[\s\.\-]?([0-9]{3})[\s\.\-]?([0-8][0-9]|9[0-7])\z/,
  message: "must be a valid social security number" }, allow_nil: true
  validates :bio, length: { minimum: 20 }, allow_nil: true
  mount_uploader :photo, PhotoUploader
  acts_as_voter


  after_create do |user|
    post_new_user(user)
    invite_user(user)
  end

  def set_status_in_community
    self.user_number_votes
    if self.user_number_votes > 29
      self.status_in_community = "god"
      self.save
    elsif self.user_number_votes > 9
      self.status_in_community = "fighter"
      self.save
    else
      self.status_in_community = "newbie"
      self.save
    end
  end

  def user_number_votes
    questions = Question.where(user_id: self.id)
    upvotes = 0
    if questions
      questions.each do |question|
        answers = []
        self.answers.each do |answer|
          answers << answer.get_upvotes.size
        end
        upvotes += answers.sum
      end
    end
    return upvotes
  end

  def waiting_questions
    questions = Question.where(user_id: self.id, answered: false)
  end

  private

  def invite_user(user)
    SlackPost.new.send_invite(user)
  end

  def post_new_user(user)
    unless user.slackname
      user.slackname = "#{user.firstname}"
    end

    user.save!
    SlackPost.new.post_new_user(user).deliver
  end
end
