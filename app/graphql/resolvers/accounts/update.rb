# frozen_string_literal: true

module Resolvers
  module Accounts
    class Update < BaseResolver

      argument :account, Inputs::AccountUpdateInput

      type Types::AccountType

      def call(_obj, args, ctx)
        authenticate_request!(ctx[:headers])
        handle(Account::Update.call(params: { account: args[:account].to_h },
                                    current_user: current_user))
      end
    end
  end
end
