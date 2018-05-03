# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __dir__)

require 'sentry_rescue'

def raise_exception
  raise 'error'
rescue StandardError
  raise 'StandardError error'
end

SentryRescue.capture do
  raise_exception
end
