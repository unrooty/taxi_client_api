module Resolvers
  module Accounts
    class ConfirmEmail < BaseResolver
      argument :confirmation_token, !types.String

      type Types::AccountType

      def call(_obj, args, _ctx)
        handle(Account::ConfirmEmail.call(params: args.to_h))
      end
    end
  end
end
