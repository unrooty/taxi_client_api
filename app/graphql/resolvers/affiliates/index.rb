module Resolvers
  module Affiliates
    class Index < BaseResolver

      type !types[Types::AffiliateType]

      def call(_obj, _args, _ctx)
        result = Affiliate::Index.call()
        handle(result)
      end
    end
  end
end
