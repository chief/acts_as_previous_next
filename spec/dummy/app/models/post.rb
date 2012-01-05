class Post < ActiveRecord::Base
  acts_as_previous_next column: :id, with_cancan: true
end
