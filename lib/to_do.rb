class ToDo < ActiveRecord::Base
  has_many :stickies, :as => :stickable
  has_many :tags, :through => :taggable_tags, :as => :taggable
  has_many :taggable_tags


  validates :name, :length => {:minimum => 2, :maximum => 25}
  validates :name, :presence => true

end

