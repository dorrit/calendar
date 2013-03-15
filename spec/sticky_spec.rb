require 'spec_helper'

describe Sticky do 
  context 'associations' do 
    it {should belong_to(:stickable)}
  end
end