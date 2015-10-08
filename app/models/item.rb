class Item < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true

  def toggle_completed
    self.completed = self.completed == true ? false : true
    self.save
  end
end
