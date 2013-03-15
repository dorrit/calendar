class Sticky < ActiveRecord::Base
  belongs_to :stickable, :polymorphic => true
  validates :note, :length => { :minimum => 2, :maximum => 125 }
  validates :stickable, :note, :presence => true

end