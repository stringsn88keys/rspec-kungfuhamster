rspec-kungfuhamster
======================

Animated kung fu hamster formatter

# Sample Output

As your tests run, you'll see an animated kung fu hamster performing various martial arts moves:

```
    ()__()
    / o o\
   |' =Y=';----
   { \  / }
    mmm mmm
```

The hamster is colorized based on your test results:
- **Green** portion: Passing tests
- **Yellow** portion: Pending tests
- **Red** portion: Failing tests

The hamster cycles through different kung fu poses as each test completes, creating an animated effect in your terminal!

# Installation

Add this to your Gemfile (in the test group) and run `bundle install`:

``` ruby
gem 'rspec-kungfuhamster'
```

# Usage

After installing the gem, you can use the formatter in several ways:

## Formatters

The gem provides two formatters:

### Basic Formatter

The basic formatter shows just the animated kung fu hamster with color-coded animation.

### Detailed Formatter

The detailed formatter shows the animated kung fu hamster with additional information below:
- Color-coded statistics (passed/pending/failed out of total examples)
- Last spec file that was executed

## Command Line

Run RSpec with the formatter specified:

```bash
# Basic formatter
rspec --format RspecKungFuHamster::Formatter

# Detailed formatter
rspec --format RspecKungFuHamster::DetailedFormatter
```

## Configuration File

Add to your `.rspec` file in your project root:

```
# Basic formatter
--format RspecKungFuHamster::Formatter

# OR detailed formatter
--format RspecKungFuHamster::DetailedFormatter
```

## RSpec Configuration

Add to your `spec/spec_helper.rb` or `spec/rails_helper.rb`:

```ruby
RSpec.configure do |config|
  # Basic formatter
  config.formatter = RspecKungFuHamster::Formatter

  # OR detailed formatter
  config.formatter = RspecKungFuHamster::DetailedFormatter
end
```

Or if you want to use multiple formatters:

```ruby
RSpec.configure do |config|
  config.formatter = :progress  # or :documentation
  config.add_formatter RspecKungFuHamster::DetailedFormatter
end
```

# Development

## Automated Version Bumping

This gem uses automated version bumping on pull requests merged to `main` or `master`. The version bump type is determined by labels on the PR:

- **`major`** label: Bumps the major version (e.g., 1.2.3 → 2.0.0)
- **`minor`** label: Bumps the minor version (e.g., 1.2.3 → 1.3.0)
- **No label**: Defaults to patch bump (e.g., 1.2.3 → 1.2.4)

The workflow automatically:
1. Detects the bump type from PR labels
2. Updates the version in `lib/rspec_kung_fu_hamster/version.rb`
3. Commits the version bump with message `[skip ci]`
4. Creates and pushes a git tag (e.g., `v1.2.3`)

### Manual Version Bumping

You can also manually bump the version using the script:

```bash
ruby scripts/bump_version.rb [major|minor|patch]
```
