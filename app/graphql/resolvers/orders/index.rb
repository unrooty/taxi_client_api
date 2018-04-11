module Resolvers
  module Orders
    class Index < BaseResolver

      type !types[Types::OrderType]

      def call(*)
        result = Order::Index.call()
        handle(result)
      end
    end
  end
end
