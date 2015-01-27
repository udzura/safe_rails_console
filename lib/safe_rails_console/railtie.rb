require 'rails/railtie'

module SafeRailsConsole
  class Railtie < Rails::Railtie
    console do
      if Rails.application.sandbox?
        if setting = ActiveRecord::Base.configurations["#{Rails.env}_readonly"]
          require "active_record/railties/console_sandbox"
          ActiveRecord::Base.connection.rollback_transaction
          Rails.logger.info "Old connection closed"

          ActiveRecord::Base.establish_connection(setting)

          ActiveRecord::Base.connection.begin_transaction(joinable: false)
          Rails.logger.info "Connnected to readonly database:\n#{setting.inspect}"
        end
      end
    end
  end
end
