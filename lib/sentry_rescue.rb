require 'sentry_rescue/version'
require 'interception'

# Intercept all exceptions that raise in the block and start a SentryCapture
module SentryRescue
  def self.capture(&block)
    Interception.listen(block) do |exception, _|
      if defined?(Raven)
        Raven.capture_exception(exception)
      else
        puts exception.message
      end
    end
  end
end
