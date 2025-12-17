rspec-kungfuhamster
======================

Animated kung fu hamster formatter

# Installation

Add this to your Gemfile (in the test group) and run `bundle install`:

``` ruby
gem 'rspec-kungfuhamster'
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
