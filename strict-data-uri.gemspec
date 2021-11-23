# frozen_string_literal: true

require_relative "lib/strict/data/uri/version"

Gem::Specification.new do |spec|
  spec.name          = "strict-data-uri"
  spec.version       = Strict::Data::Uri::VERSION
  spec.authors       = ["Emil Kampp"]
  spec.email         = ["emil@kampp.me"]

  spec.summary       = "Strict Data-URI en/decoding"
  spec.description   = "En/decodes Data-URI without newlines in the base64 encoded string"
  spec.homepage      = "https://github.com/ekampp/strict-data-uri"
  spec.license       = "MIT"
  spec.required_ruby_version = "~> 3.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ekampp/strict-data-uri"
  spec.metadata["changelog_uri"] = "https://github.com/ekampp/strict-data-uri/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }
end
