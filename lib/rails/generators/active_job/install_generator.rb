require 'rails/generators/base'

module ActiveJob
  module Generators # :nodoc:
    class InstallGenerator < Rails::Generators::Base # :nodoc:
      desc 'Creates a active job initializer to your application.'
      
      SUPPORTED_ADAPTERS = %w(inline backburner delayed_job qu que queue_classic resque sidekiq sneakers sucker_punch)

      class_option :adapter, type: :string, default: 'inline', desc: 'The queue adapter name'

      def self.default_generator_root
        File.dirname(__FILE__)
      end

      def create_initializer
        template 'initializer.rb', 'config/initializers/active_job.rb'
      end

      protected

      def adapter_name
        adapter = options[:adapter].underscore
        warn "Unsupported adapter #{adapter}. Adapters currently supported: #{SUPPORTED_ADAPTERS}" unless adapter.in?(SUPPORTED_ADAPTERS)
        adapter
      end

    end
  end
end