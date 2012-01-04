require 'active_support/concern'

module ActsAsPreviousNext
  extend ActiveSupport::Concern

  included do

    def self.acts_as_previous_next(*options)
    end

  end
end

ActiveRecord::Base.send :include, ActsAsPreviousNext
