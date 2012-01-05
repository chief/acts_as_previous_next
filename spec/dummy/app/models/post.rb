class Post < ActiveRecord::Base
  acts_as_previous_next with_cancan: true
end
