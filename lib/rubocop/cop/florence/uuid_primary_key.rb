# frozen_string_literal: true

module RuboCop
  module Cop
    module Florence
      class UuidPrimaryKey < Base
        extend AutoCorrector

        RESTRICT_ON_SEND = [:create_table].freeze
        MSG = 'Use uuid primary keys.'

        def on_send(node)
          id_argument = find_id_argument(node)

          return if id_argument&.sym_type? && id_argument.value == :uuid

          add_offense(node) do |corrector|
            if id_argument.nil?
              corrector.insert_after(node, ', id: :uuid')
            else
              corrector.replace(id_argument, ':uuid')
            end
          end
        end

        private

        def find_id_argument(send_node)
          return unless send_node.last_argument&.hash_type?

          send_node.last_argument.each_pair.find do |pair|
            next unless pair.key.sym_type? && pair.key.value == :id

            break pair.value
          end
        end
      end
    end
  end
end
