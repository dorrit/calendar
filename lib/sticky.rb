class Sticky < ActiveRecord::Base
  belongs_to :stickable, :polymorphic => true


end