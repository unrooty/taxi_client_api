# frozen_string_literal: true

module Account
  class Register < Trailblazer::Operation
    step Model(User, :new)
    step self::Contract::Build(constant: Account::Contract::Register)
    step Wrap(SequelTransaction) {
      step self::Contract::Validate(key: :user)
      step :add_confirm_token_to_user
      step self::Contract::Persist()
      step :send_confirmation_email
    }

    private

    def add_confirm_token_to_user(_options, model:, **)
      model.confirmation_token = SecureRandom.urlsafe_base64.to_s
    end

    def send_confirmation_email(_options, model:, **)
      UserMailer.confirmation_email(model).deliver
      model.update(confirmation_sent_at: Time.now)
    end
  end
end
