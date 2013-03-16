require 'spec_helper'

describe TaggableTag do 
  context 'associations' do 
    it {should belong_to(:tag)}
    it {should belong_to(:taggable)}
  end

end