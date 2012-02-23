module TwitterCldr
  module Formatters
    module Plurals
      class Rules
        class << self
          def all
            all_for(TwitterCldr::get_locale)
          end

          def all_for(locale)
            locale = locale.to_sym
            get_resource(locale)[locale][:i18n][:plural][:keys]
          rescue => e
            []
          end

          def rule_for(number, locale = TwitterCldr::get_locale)
            locale = locale.to_sym
            get_resource(locale)[locale][:i18n][:plural][:rule].call(number)
          rescue => e
            :other
          end

          protected

          def get_resource(locale)
            eval(TwitterCldr.resources.resource_for(locale, "plurals")[TwitterCldr.convert_locale(locale)])
          end
        end
      end
    end
  end
end