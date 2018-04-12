module Feedback::Contract
  class Send < Reform::Form
    property :name
    property :email
    property :message
  end
end
