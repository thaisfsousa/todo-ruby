require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:list) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
  end
end