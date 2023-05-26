# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Florence::ServiceSingleEntryPoint, :config do
  it 'registers no offence when the only public methods are .call, #initialize, and #call' do
    expect_no_offenses(<<~RUBY)
      class ServiceClass
        def self.call; end

        def initialize; end

        def call; end

        protected

        def protected_method; end

        private

        def private_method; end
      end
    RUBY
  end

  it 'registers an offence when there is an extra public method' do
    expect_offense(<<~RUBY)
      class ServiceClass
        def self.call; end

        def initialize; end

        def call; end

        def extra_public_method; end
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Service objects should only have one entry point: `ServiceClass.call()`.
        protected

        def protected_method; end

        private

        def private_method; end
      end
    RUBY
  end
end
