class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :permissions, presence: true
  validates :permissions, inclusion: { in: %w(private viewable open),
    message: "%{value} is not a valid permission." }
end
