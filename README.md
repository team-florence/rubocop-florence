# Rubocop::Florence

Single source of truth for Ruby styling across our Ruby projects.

## Installation

Add to your gemfile:

```rb
group :development do
  gem 'rubocop-florence', git: 'https://github.com/team-florence/rubocop-florence', tag: '< ADD VERSION TAG HERE >', require: false
end
```

rubocop-florence handles all of our other Rubocop extensions and their versions for you so you can remove all other Rubocop gems from your Gemfile, including Rubocop itself.

```rb
# Bad
group :development do
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-florence', git: 'https://github.com/team-florence/rubocop-florence', tag: '< ADD VERSION TAG HERE >', require: false
end

# Good
group :development do
  gem 'rubocop-florence', git: 'https://github.com/team-florence/rubocop-florence', tag: '< ADD VERSION TAG HERE >', require: false
end
```

Then at the very top of your project's `.rubocop.yml` file add:

```yaml
inherit_gem:
  rubocop-florence: config/.florence.rubocop.yml

# Any other project-specific config here...
```

This points your project to inherit its Rubocop config from the centralised config within the rubocop-florence gem.

That is it!

rubocop-florence will now handle the rubocop versions your project is running and ensure all our projects are enforcing the same Ruby style guide.
