# frozen_string_literal: true

module Account
  module Contract
    class Update < Reform::Form
      include ActiveModel::Validations
      property :first_name
      property :last_name
      property :email
      property :password
      property :password_confirmation
      property :phone
      property :city
      property :address

      validates :phone, presence: true, length: { is: 9 }
      validates :first_name, :last_name, presence: true, format: /[A-Za-z]/
      validates :password, length: { minimum: 8, allow_blank: true },
                           confirmation: true
      validates :email, uniqueness: true, presence: true
      validates :current_password, presence: true,
                format: /\A[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+\z/

      def phone=(value)
        super(value.gsub(/[^\d]/, ''))
      end
    end
  end
end
