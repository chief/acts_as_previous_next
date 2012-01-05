require 'active_support/concern'

module ActsAsPreviousNext
  extend ActiveSupport::Concern

  included do
    def self.acts_as_previous_next(options = {})

      configuration = { column: 'id', use_cancan: false }
      configuration.update(options) if options.is_a?(Hash)

      column     = options[:column] || "id"
      use_cancan = options[:use_cancan]

      class_eval <<-EOF

          def next
            self.class.where("#{column} > ?", self.id).order("#{column}").first ||
            self.class.order("#{column}").first
          end

          def previous
            self.class.where("#{column} < ?", self.id).order("#{column} DESC").first ||
            self.class.order("#{column} DESC").first
          end

      EOF
    end
  end
end

ActiveRecord::Base.send :include, ActsAsPreviousNext
