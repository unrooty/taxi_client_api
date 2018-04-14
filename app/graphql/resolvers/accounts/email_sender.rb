# frozen_string_literal: true

module Resolvers
  module Accounts
    module EmailSender
      class Activation < BaseResolver
        argument :email, !types.String

        type Types::AccountType

        def call(_obj, args, _ctx)
          handle(Account::EmailSender::Activation.call(params: args.to_h))
        end
      end

      class ResetPassword < BaseResolver
        argument :email, !types.String

        type Types::AccountType

        def call(_obj, args, _ctx)
          handle(Account::EmailSender::ResetPassword.call(params: args.to_h))
        end
      end
    end
  end
end
