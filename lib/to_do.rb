class ToDo < ActiveRecord::Base
  has_many :stickies, :as => :stickable

end

