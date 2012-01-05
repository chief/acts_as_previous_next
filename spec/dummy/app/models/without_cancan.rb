class WithoutCancan < ActiveRecord::Base
  acts_as_previous_next column: :position, with_cancan: false
end
