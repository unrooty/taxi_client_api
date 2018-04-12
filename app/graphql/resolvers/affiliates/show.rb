# frozen_string_literal: true

module Resolvers
  module Affiliates
    class Show < BaseResolver

      type Types::AffiliateType

      argument :id, types.ID

      def call(_obj, args, *)
        handle(Affiliate::Show.call(params: { id: args[:id] }))
      end
    end
  end
end
