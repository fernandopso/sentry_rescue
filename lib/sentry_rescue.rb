# frozen_string_literal: true

require 'sentry_rescue/version'
require 'sentry-raven'
require 'interception'

# Intercept all exceptions that raise in the block and start a SentryCapture
module SentryRescue
  def self.capture(&block)
    Interception.listen(block) do |exception, _|
      Raven.capture_exception(exception)
    end
  end
end
