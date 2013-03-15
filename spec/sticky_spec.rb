require 'spec_helper'

describe Sticky do 
  context 'associations' do 
    it {should belong_to(:stickable)}
    it {should have_many(:stickies)}
  end

  context 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :stickable}
    it {should ensure_length_of(:name).is_at_least(2).is_at_most(125)} 
  end
end