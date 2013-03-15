require 'spec_helper'

describe Sticky do 
  context 'associations' do 
    it {should belong_to(:stickable)}
  end

  context 'validations' do 
    it {should validate_presence_of :note}
    it {should validate_presence_of :stickable}
    it {should ensure_length_of(:note).is_at_least(2).is_at_most(125)} 
  end
end