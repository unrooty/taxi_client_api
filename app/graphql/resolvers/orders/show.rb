# frozen_string_literal: true

module Resolvers
  module Orders
    class Show < BaseResolver

      argument :id, !types.ID

      type Types::OrderType

      def call(_org, args, ctx)
        authenticate_request!(ctx[:headers])
        handle(Order::Show.call(params: args.to_h,
                                current_user: current_user))
      end
    end
  end
end
