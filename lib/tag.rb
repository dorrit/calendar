class Tag < ActiveRecord::Base
  has_many :taggables, :through => :taggable_tags
  has_many :taggable_tags
end
