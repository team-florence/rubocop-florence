# frozen_string_literal: true

require_relative 'lib/rubocop/florence/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-florence'
  spec.version = RuboCop::Florence::VERSION
  spec.authors = ['Sam Jenkins']
  spec.email = ['dustpan.umpires0y@icloud.com']

  spec.summary = 'Single source of truth for Ruby styling across our Ruby projects.'
  spec.homepage = 'https://github.com/team-florence/rubocop-florence'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/team-florence/rubocop-florence/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_runtime_dependency 'rubocop', '>= 1.31', '< 1.37'
  spec.add_runtime_dependency 'rubocop-performance', '~> 1.14.0'
  spec.add_runtime_dependency 'rubocop-rails', '~> 2.15.0'
  spec.add_runtime_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_runtime_dependency 'rubocop-rspec', '~> 2.12.0'
  spec.add_runtime_dependency 'rubocop-thread_safety', '~> 0.4.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
