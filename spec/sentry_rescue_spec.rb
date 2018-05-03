# frozen_string_literal: true

RSpec.describe SentryRescue do
  describe '.capture' do
    context 'when raise exception' do
      it 'track exception on Sentry' do
        # Verify
        expect(Raven)
          .to receive(:capture_exception)
          .with(StandardError)
          .exactly(1).times

        # Setup
        SentryRescue.capture do
          begin
            raise StandardError
          rescue StandardError => e
            puts e.message
          end
        end
      end
    end
  end
end
