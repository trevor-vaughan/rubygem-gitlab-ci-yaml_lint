# Gitlab::Ci::YamlLint

This gem allows you to run a local validation of your `.gitlab-ci.yml` files.

Rake tasks are additionally include for validating your project
`.gitlab-ci.yml` files as part of your standard development workflow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitlab-ci-yaml_lint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitlab-ci-yaml_lint

## Usage

### CLI

You can validate a `.gitlab-ci.yml` file using the `gitlab-ci-yaml_lint`
application by passing it the path to your local `.gitlab-ci.yml` file.

### Rake Integration

To use the rake tasks, simply include the following in your project's `Rakefile`:

```ruby
require 'gitlab/ci/yaml_lint/rake/tasks'

Gitlab::Ci::YamlLint::Rake::Tasks.new(File.dirname(__FILE__))
```

This will result in tasks being created under the `gitlab_ci` namespace.

You can get a full listing by running `rake -D gitlab_ci`.

## Development

After checking out the repo, run `bundle install` to install dependencies.
Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on the [GitHub project page](/../../).
