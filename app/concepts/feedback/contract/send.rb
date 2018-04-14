module Feedback::Contract
  class Send < Reform::Form
    property :name
    property :email
    property :message

    validates :name, :email, :message, presence: true
    validates :message, length: { minimum: 10 }
    validates :email, format: /\A[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+\z/
  end
end
