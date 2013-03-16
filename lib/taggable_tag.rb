class TaggableTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
end