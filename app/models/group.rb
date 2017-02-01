class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members_joined, through: :members, source: :user
  has_many :members, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, length: { minimum: 6 }, allow_nil: true
  validates :description, length: {minimum: 10}, allow_nil: true
end
