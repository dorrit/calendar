class Engagement < ActiveRecord::Base
  has_many :stickies, :as => :stickable
  validates :name, :length => { :minimum => 2, :maximum => 25 }
  validates :name, :date_time, :presence => true
end