# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'sentry_rescue/version'

Gem::Specification.new do |spec|
  spec.name          = 'sentry_rescue'
  spec.version       = SentryRescue::VERSION
  spec.authors       = ['Fernando Pereira']
  spec.email         = ['fernandopso@bsi.ufla.br']

  spec.summary       = 'Send exception to Sentry'
  spec.description   = 'Send exception to Sentry'
  spec.homepage      = 'http://github.com/fernandopso/sentry_rescue'
  spec.license       = 'MIT'

  spec.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |Gemfile
    |\.rspec
    |\.gitignore
    )$}x
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'interception'
  spec.add_runtime_dependency 'sentry-raven'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
