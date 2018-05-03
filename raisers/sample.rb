$LOAD_PATH.unshift File.expand_path '../../lib', __FILE__
require 'sentry_rescue'

def raise_exception
  raise 'raise without => e'
rescue StandardError => e
  raise 'raise with => e'
  puts 'continue...'
end

SentryRescue.capture do
  raise_exception
end
