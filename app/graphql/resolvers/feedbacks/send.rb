module Resolvers
  module Feedbacks
    class Send < BaseResolver

      argument :feedback, Inputs::FeedbackInput

      type Types::FeedbackType

      def call(_obj, args, _ctx)
        handle(Feedback::Send.call(params: { feedback: args.to_h }))
      end
    end
  end
end
