class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password
  validates :name, presence: true, length: {minimum: 3}, format: { with: /\A[a-zA-Z\s]*\z/}
  validates :email, presence: true, uniqueness: {case_sensitve: false}, format: {with: VALID_EMAIL_REGEX}
  validates :password, length: {minimum: 8}
  validates :description, presence: true
  has_many :networks, :foreign_key => "user_id", :class_name => "Network"
  has_many :networkees, through: :networks
  has_many :invites, :foreign_key => "user_id", :class_name => "Invite"
  has_many :invitees, through: :invites
end
