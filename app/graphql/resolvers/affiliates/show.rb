# frozen_string_literal: true

module Resolvers
  module Affiliates
    class Show < BaseResolver
      type Types::AffiliateType

      argument :id, types.ID

      def call(_obj, args, *)
        result = Affiliate::Show.call(params: { id: args[:id] })
        handle(result)
      end
    end
  end
end
