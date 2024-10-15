# frozen_string_literal: true

require_relative 'lib/rubocop/florence/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-florence'
  spec.version = RuboCop::Florence::VERSION
  spec.authors = ['Sam Jenkins']
  spec.email = ['dustpan.umpires0y@icloud.com']

  spec.summary = 'Single source of truth for Ruby styling across our Ruby projects.'
  spec.homepage = 'https://github.com/team-florence/rubocop-florence'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/team-florence/rubocop-florence/blob/main/CHANGELOG.md'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '1.66.1'
  spec.add_dependency 'rubocop-capybara', '2.21.0'
  spec.add_dependency 'rubocop-factory_bot', '2.26.1'
  spec.add_dependency 'rubocop-performance', '1.21.0'
  spec.add_dependency 'rubocop-rails', '2.26.2'
  spec.add_dependency 'rubocop-rake', '0.6.0'
  spec.add_dependency 'rubocop-rspec', '3.1.0'
  spec.add_dependency 'rubocop-rspec_rails', '2.30.0'
  spec.add_dependency 'rubocop-thread_safety', '0.5.1'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
