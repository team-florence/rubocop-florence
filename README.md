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

## Development

### How to release a new version

1. Ensure all the changes to be included in the new version are merged to `main`
2. Submit a final PR which:
   - bumps the version (`lib/rubocop/florence/version.rb`) number
   - update CHANGELOG.md
   - run `bundle install` to get Gemfile.lock up to date
3. Seek approval then merge the PR
4. Visit the Github repo's releases page: https://github.com/team-florence/rubocop-florence/releases and draft a new release
5. Fill out the draft release form:
   - The tag should match the version number in `lib/rubocop/florence/version.rb` and be of the form `v1.2.3`
   - The release title should match the tag
   - The description should match the CHANGELOG entry for this version
