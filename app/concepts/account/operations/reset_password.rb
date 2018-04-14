# frozen_string_literal: true

module Account
  class ResetPassword < Trailblazer::Operation
    step Model(OpenStruct, :new)

    step self::Contract::Build(constant: Account::Contract::ResetPassword)

    step self::Contract::Validate()
    failure :validation_error!, fail_fast: true

    step :find_user
    failure :user_not_found!

    step :reset_password

    private

    def validation_error!(options, *)
      options[:errors] = {
        message:
            options['result.contract.default'].errors.full_messages.join(', '),
        status: 422
      }
    end

    def find_user(options, params:, **)
      options[:model] = User[reset_password_token: params['reset_password_token']]
    end

    def user_not_found!(options, **)
      options[:errors] = {
        message: 'Reset password token invalid.',
        status: 422
      }
    end

    def reset_password(_options, model:, params:, **)
      model.update(password: params['password'],
                   password_confirmation: params['password_confirmation'],
                   reset_password_token: nil)
    end
  end
end
