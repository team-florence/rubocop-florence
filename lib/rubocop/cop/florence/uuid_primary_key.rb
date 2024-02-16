# frozen_string_literal: true

require 'rubocop-rails'

module RuboCop
  module Cop
    module Florence
      class UuidPrimaryKey < Base
        include MigrationsHelper
        extend AutoCorrector

        RESTRICT_ON_SEND = [:create_table].freeze
        MSG = 'Use uuid primary keys.'

        def on_send(node)
          return unless in_migration?(node)

          id_argument = find_id_argument(node)

          return if id_argument&.sym_type? && id_argument.value == :uuid

          add_offense(node) { |corrector| add_uuid_option(corrector, node, id_argument) }
        end

        private

        def find_id_argument(send_node)
          return unless send_node.last_argument&.hash_type?

          send_node.last_argument.each_pair.find do |pair|
            next unless pair.key.sym_type? && pair.key.value == :id

            break pair.value
          end
        end

        def add_uuid_option(corrector, node, id_argument)
          if node.last_argument.nil?
            corrector.insert_after(node, ' id: :uuid')
          elsif id_argument.nil?
            corrector.insert_after(node, ', id: :uuid')
          else
            corrector.replace(id_argument, ':uuid')
          end
        end
      end
    end
  end
end
