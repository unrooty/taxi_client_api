# frozen_string_literal: true

module Resolvers
  module Orders
    class Index < BaseResolver

      type !types[Types::OrderType]

      def call(_obj, _args, ctx)
        handle(Order::Index.call(current_user: ctx[:current_user]))
      end
    end
  end
end
