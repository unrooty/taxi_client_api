# frozen_string_literal: true

module Resolvers
  module Orders
    class Create < BaseResolver

      argument :order, Inputs::OrderInput

      type Types::OrderType

      def call(_obj, args, ctx)
        handle(Order::Create.call(params: { order: args[:order].to_h },
                                  headers: ctx))
      end
    end
  end
end
