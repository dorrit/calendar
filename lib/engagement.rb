class Engagement < ActiveRecord::Base
  has_many :stickies, :as => :stickable
  
end