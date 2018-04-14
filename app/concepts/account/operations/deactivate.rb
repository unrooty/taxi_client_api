# frozen_string_literal: true

module Account
  class Deactivate < Trailblazer::Operation
    step :deactivate
    step :user_not_found!

    private

    def deactivate(_options, current_user:, **)
      current_user&.update(active: false,
                           activation_token: SecureRandom.urlsafe_base64.to_s)
    end

    def user_not_found!(options, *)
      options[:errors] = {
        message: 'User not found.',
        status: 404
      }
    end

    def send_email_to_user(_options, current_user:, **)
      UserMailer.account_deactivated(current_user).deliver
    end
  end
end
