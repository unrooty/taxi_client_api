Inputs::FeedbackInput = GraphQL::InputObjectType.define do
  name 'FeedbackInput'

  argument :name, !types.String
  argument :email, !types.String
  argument :message, !types.String
end
