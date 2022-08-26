# frozen_string_literal: true

module RuboCop
  module Cop
    module Florence
      class ServiceSingleEntryPoint < Base
        include DefNode

        ALLOWED_PUBLIC_METHODS = %i[call initialize].freeze
        MSG = 'Service objects should only have one entry point: `ServiceClass.call()`.'

        def on_def(node)
          return if non_public?(node)
          return if ALLOWED_PUBLIC_METHODS.include? node.method_name

          add_offense(node)
        end
      end
    end
  end
end
