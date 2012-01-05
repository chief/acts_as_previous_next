require 'active_support/concern'

module ActsAsPreviousNext
  extend ActiveSupport::Concern

  included do
    def self.acts_as_previous_next(options = {})

      configuration = { column: 'id', with_cancan: false }
      configuration.update(options) if options.is_a?(Hash)

      if options.is_a? Symbol
        column = options.to_s
      elsif options.is_a? Hash
        column      = options[:column] || "id"
        with_cancan = options[:with_cancan]
      end

      puts 'column = ' + column.to_s

      class_eval <<-EOF

        if with_cancan

          def next(ability)
            self.class.accessible_by(ability).where("#{column} > ?", self.send('#{column}')).order("#{column}").first ||
            self.class.accessible_by(ability).order("#{column}").first
          end

          def previous(ability)
            self.class.accessible_by(ability).where("#{column} < ?", self.send('#{column}')).order("#{column} DESC").first ||
            self.class.accessible_by(ability).order("#{column} DESC").first
          end


        else

          def next
            self.class.where("#{column} > ?", self.send('#{column}')).order("#{column}").first ||
            self.class.order("#{column}").first
          end

          def previous
            self.class.where("#{column} < ?", self.send('#{column}')).order("#{column} DESC").first ||
            self.class.order("#{column} DESC").first
          end

        end


      EOF
    end
  end
end

ActiveRecord::Base.send :include, ActsAsPreviousNext
