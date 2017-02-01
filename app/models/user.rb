class User < ActiveRecord::Base
  has_secure_password
  has_many :groups, through: :members
  has_many :members

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password, length: { minimum: 8 }, allow_nil: true
end
