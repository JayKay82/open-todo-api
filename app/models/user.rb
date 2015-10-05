class User < ActiveRecord::Base
  has_many :lists

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
