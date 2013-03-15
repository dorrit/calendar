
require 'spec_helper'

describe Engagement do 
  context 'associations' do 
    it {should have_many(:stickies)}
  end
end

