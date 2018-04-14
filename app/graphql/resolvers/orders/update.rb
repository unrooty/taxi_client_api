# frozen_string_literal: true

module Resolvers
  module Orders
    class Update < BaseResolver

      argument :id, !types.ID
      argument :order, Inputs::OrderInput

      type Types::OrderType

      def call(_obj, args, ctx)
        authenticate_request!(ctx[:headers])
        handle(Order::Update.call(params: args.to_h,
                                  current_user: current_user))
      end
    end
  end
end
