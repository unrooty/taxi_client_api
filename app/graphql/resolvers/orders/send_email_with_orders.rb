module Resolvers
  module Orders
    class SendEmailWithOrders < BaseResolver

      type types[Types::OrderType]

      def call(_obj, _args, ctx)
        authenticate_request!(ctx[:headers])
        handle(Order::SendEmailWithOrders.call(current_user: current_user))
      end
    end
  end
end
