class Post < ActiveRecord::Base
  acts_as_previous_next
end
