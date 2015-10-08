class Item < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true

  def mark_completed
    self.name += ' (completed)'
    self.save
  end
end
