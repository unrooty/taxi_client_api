module Resolvers
  module Accounts
    class ResetPassword < BaseResolver
      argument :reset_password_token, !types.String
      argument :password, !types.String
      argument :password_confirmation, !types.String

      type Types::AccountType

      def call(_obj, args, _ctx)
        handle(Account::ResetPassword.call(params: args.to_h))
      end
    end
  end
end
