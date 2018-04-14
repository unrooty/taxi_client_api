module Resolvers
  module Accounts
    class Activate < BaseResolver
      argument :activation_token, !types.String

      type Types::AccountType

      def call(_obj, args, _ctx)
        handle(Account::Activate.call(params: args.to_h))
      end
    end
  end
end
