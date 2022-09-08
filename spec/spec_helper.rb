# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
  minimum_coverage line: 100, branch: 100
  add_filter 'lib/rubocop/florence/inject.rb'
end

require 'rubocop-florence'
require 'rubocop/rspec/support'

RSpec.configure do |config|
  config.include RuboCop::RSpec::ExpectOffense

  config.disable_monkey_patching!
  config.raise_errors_for_deprecations!
  config.raise_on_warning = true
  # config.fail_if_no_examples = true

  config.order = :random
  Kernel.srand config.seed
end
