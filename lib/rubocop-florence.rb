# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/florence'
require_relative 'rubocop/florence/version'
require_relative 'rubocop/florence/inject'

RuboCop::Florence::Inject.defaults!

require_relative 'rubocop/cop/florence_cops'
