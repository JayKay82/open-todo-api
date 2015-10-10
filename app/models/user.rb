class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
