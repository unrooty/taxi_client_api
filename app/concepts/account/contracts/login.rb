# frozen_string_literal: true

module Account
  module Contract
    class Login < Reform::Form
      property :email
      property :password
      property :device_id

      validates :email, :password, :device_id, presence: true
    end
  end
end
