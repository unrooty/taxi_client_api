module Resolvers
  module Affiliates
    class Index < BaseResolver

      type !types[Types::AffiliateType]

      def call(_obj, _args, _ctx)
        handle(Affiliate::Index.call)
      end
    end
  end
end
