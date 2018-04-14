# frozen_string_literal: true

module Resolvers
  module Orders
    class Index < BaseResolver

      type !types[Types::OrderType]

      def call(_obj, _args, ctx)
        authenticate_request!(ctx[:headers])
        handle(Order::Index.call(current_user: current_user))
      end
    end
  end
end
