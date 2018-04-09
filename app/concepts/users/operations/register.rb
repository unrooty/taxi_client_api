class User::Register < Trailblazer::Operation

  step Model(User, :new)
  step Contract::Build(constant: User::Contract::Register)
  success :bring_number_to_right_format
  step Wrap(SequelTransaction) {
    step Contract::Validate(key: :user)
    step :add_confirm_token_to_user
    step Contract::Persist()
    step :send_confirmation_email
    }

  private

  def bring_number_to_right_format(_options, params:, **)
    params['user']['phone'].gsub!(/[^\d]/, '')
  end

  def add_confirm_token_to_user(_options, model:, **)
    model.confirmation_token = SecureRandom.urlsafe_base64.to_s
  end

  def send_confirmation_email(_options, model:, **)
    UserMailer.confirmation_email(model).deliver
    model.update(confirmation_sent_at: Time.now)
  end
end
