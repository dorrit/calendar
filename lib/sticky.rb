class Sticky < ActiveRecord::Base
  belongs_to :stickable, :polymorphic => true
  has_many :stickies, :as => :stickable
  validates :name, :length => { :minimum => 2, :maximum => 125 }
  validates :stickable, :name, :presence => true

end