require 'spec_helper'

describe ToDo do 
  context 'associations' do 
    it {should have_many(:stickies)}
  end

  context 'validations' do 
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_least(2).is_at_most(25)} 
  end 
end