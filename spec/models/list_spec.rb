require 'rails_helper'

RSpec.describe List, type: :model do


  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should belong_to(:user) }
    it { should have_many(:todo_items) }
  end
  
  
  
end
