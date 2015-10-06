require 'rails_helper'

RSpec.describe List, type: :model do
  it { should belong_to :user }
  it { should have_many :items }
  it { should validate_presence_of :name }
  it { should validate_presence_of :permissions }
end
