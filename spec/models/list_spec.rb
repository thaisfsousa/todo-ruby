require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'associations' do
    it { should have_many(:tasks) }
    it { should have_many(:todos).class_name('List').with_foreign_key('parent_list_id') }
    it { should belong_to(:parent_list).class_name('List').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
  end

end
