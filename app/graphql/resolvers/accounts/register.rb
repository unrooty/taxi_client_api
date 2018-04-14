module Resolvers
  module Accounts
    class Register < BaseResolver

      argument :account, Inputs::AccountRegisterInput

      type Types::AccountType

      def call(_obj, args, ctx)
        handle(Account::Register.call(params: { account: args[:account].to_h }))
      end
    end
  end
end
