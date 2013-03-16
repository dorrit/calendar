require 'spec_helper'

describe Tag do 
  context 'associations' do 
    it {should have_many(:taggables).through(:taggable_tags)}
  end

end