# frozen_string_literal: true

module Resolvers
  module Accounts
    class Login < BaseResolver

      argument :email, !types.String
      argument :password, !types.String
      argument :device_id, !types.String

      type Types::TokenType

      def call(_obj, args, _ctx)
        handle(Account::Login.call(params: args.to_h))
      end
    end
  end
end
