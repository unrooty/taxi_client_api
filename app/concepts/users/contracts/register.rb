# frozen_string_literal: true

module User::Contract
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

    validates :password, confirmation: true
    validates :email, uniqueness: true
  end
end
