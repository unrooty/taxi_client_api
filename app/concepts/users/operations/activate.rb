# frozen_string_literal: true

class User::Activate < Trailblazer::Operation
  step :activate_user!
  failure :activation_token_invalid!

  private

  def activate_user!(_options, params:, **)
    user = User[activation_token: params['activation_token']]
    user&.update(active: true, activation_token: nil)
  end

  def activation_token_invalid!(options, *)
    options[:errors] = {
      message: 'Activation token invalid',
      status: 422
    }
  end
end
