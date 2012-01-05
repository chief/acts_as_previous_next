class WithoutCancan < ActiveRecord::Base
  acts_as_previous_next :position
end
