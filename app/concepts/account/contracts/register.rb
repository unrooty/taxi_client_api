# frozen_string_literal: true

module Account
  module Contract
    class Register < Reform::Form
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
      validates :first_name, :last_name, presence: true
      validates :password, presence: true, confirmation: true,
                           length: { minimum: 8 }, format: /[A-Za-zА-Яа-я-]/
      validates :password_confirmation, presence: true
      validates :email, uniqueness: true, presence: true,
                        format: /\A[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+\z/

      def phone=(value)
        super(value.gsub(/[^\d]/, ''))
      end
    end
  end
end
