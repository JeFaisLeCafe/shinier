class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :disease
  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates_format_of :email,:with => Devise::email_regexp
  validates :location, presence: true
  validates :secu_nb, format: { with: /\A(?P<gender>[1278])(?P<year>\d{2})(?P<month>0[1-9]|1[0-2]|20)(?P<department>\d{2}|2[AB])(?P<city>\d{3})(?P<certificate>\d{3})(?P<key>\d{2})\z/,
    message: "must be a valid social security number" }
  validates :bio, length: { minimum: 20}
end
