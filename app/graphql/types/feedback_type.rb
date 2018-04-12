Types::FeedbackType = GraphQL::ObjectType.define do
  name 'Feedback'

  field :name, !types.String
  field :email, !types.String
  field :message, types.String
end
