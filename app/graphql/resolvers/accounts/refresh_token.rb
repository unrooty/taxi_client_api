# frozen_string_literal: true

module Resolvers
  module Accounts
    class RefreshToken < BaseResolver

      argument :refresh_token, !types.String

      type Types::TokenType

      def call(_obj, args, _ctx)
        handle(Account::RefreshToken.call(params: args.to_h))
      end
    end
  end
end
