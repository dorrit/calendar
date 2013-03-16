require 'spec_helper'

describe Engagement do 

  context 'validations' do 
    it {should validate_presence_of :name}
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(25) } 
    it {should validate_presence_of :date_time}
 
  end

  context 'associations' do 
    it {should have_many(:stickies)}
    it {should have_many(:tags).through(:taggable_tags)}
  end
end

