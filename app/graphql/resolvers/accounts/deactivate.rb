module Resolvers
  module Accounts
    class Deactivate < BaseResolver
      type Types::AccountType

      def call(_obj, _args, ctx)
        authenticate_request!(ctx[:headers])
        handle(Account::Deactivate.call(current_user: current_user))
      end
    end
  end
end
