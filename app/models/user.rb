class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :disease, optional: true
  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify

  # validates :firstname, presence: true
  # validates :lastname, presence: true
#   validates_format_of :email,:with => Devise::email_regexp
#   # validates :location, presence: true
  validates :secu_nb, format: { with: /\A([1-3])[\s\.\-]?([0-9]{2})[\s\.\-]?(0[0-9]|[2-35-9][0-9]|[14][0-2])[\s\.\-]?(0[1-9]|[1-8][0-9]|9[0-57-9]|2[ab])[\s\.\-]?(00[1-9]|0[1-9][0-9]|[1-8][0-9]{2}|9[0-8][0-9]|990)[\s\.\-]?([0-9]{3})[\s\.\-]?([0-8][0-9]|9[0-7])\z/,
  message: "must be a valid social security number" }
  validates :bio, length: { minimum: 20}
end
