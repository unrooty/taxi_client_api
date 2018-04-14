# frozen_string_literal: true

module Account
  module Contract
    class ResetPassword < Reform::Form
      property :reset_password_token
      property :password
      property :password_confirmation

      validates :reset_password_token, :password_confirmation, presence: true
      validates :password, presence: true,
                           length: { minimum: 8 },
                           confirmation: true
    end
  end
end
