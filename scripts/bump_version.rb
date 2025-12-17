#!/usr/bin/env ruby

# Script to bump the version in lib/rspec_kung_fu_hamster/version.rb
# Usage: ruby bump_version.rb [major|minor|patch]

bump_type = ARGV[0] || 'patch'

unless %w[major minor patch].include?(bump_type)
  STDERR.puts "Error: Invalid bump type '#{bump_type}'. Must be 'major', 'minor', or 'patch'."
  exit 1
end

version_file = File.expand_path('../lib/rspec_kung_fu_hamster/version.rb', __dir__)

unless File.exist?(version_file)
  STDERR.puts "Error: Version file not found at #{version_file}"
  exit 1
end

# Read the current version
content = File.read(version_file)
current_version = content[/VERSION = ['"]([^'"]+)['"]/, 1]

unless current_version
  STDERR.puts "Error: Could not find VERSION constant in #{version_file}"
  exit 1
end

# Parse version
major, minor, patch = current_version.split('.').map(&:to_i)

# Bump version based on type
case bump_type
when 'major'
  major += 1
  minor = 0
  patch = 0
when 'minor'
  minor += 1
  patch = 0
when 'patch'
  patch += 1
end

new_version = "#{major}.#{minor}.#{patch}"

# Update the version file
new_content = content.sub(
  /VERSION = ['"]#{Regexp.escape(current_version)}['"]/,
  "VERSION = '#{new_version}'"
)

File.write(version_file, new_content)

# Output the new version
puts new_version
