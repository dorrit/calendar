require 'spec_helper'

describe ToDo do 
  context 'associations' do 
    it {should have_many(:stickies)}
  end
end