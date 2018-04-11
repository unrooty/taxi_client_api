# frozen_string_literal: true

module Resolvers
  module Accounts
    class RefreshToken < BaseResolver

      argument :refresh_token, !types.String

      type Types::TokenType

      def call(_obj, args, _ctx)
        result = Account::RefreshToken.call(params: args.to_h)
        handle(result)
      end
    end
  end
end
