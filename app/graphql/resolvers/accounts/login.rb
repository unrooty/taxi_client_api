# frozen_string_literal: true

module Resolvers
  module Accounts
    class Login < BaseResolver

      argument :email, !types.String
      argument :password, !types.String
      argument :device_id, !types.String

      type Types::TokenType

      def call(_obj, args, _ctx)
        result = Account::Login.call(params: args.to_h)
        handle(result)
      end
    end
  end
end
