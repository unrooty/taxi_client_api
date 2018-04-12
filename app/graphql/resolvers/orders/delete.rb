# frozen_string_literal: true

module Resolvers
  module Orders
    class Delete < BaseResolver

      argument :id, !types.ID

      type Types::OrderType

      def call(_obj, args, ctx)
        handle(Order::Delete.call(params: args.to_h,
                                  current_user: ctx[:current_user]))
      end
    end
  end
end
