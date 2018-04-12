# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :login, function: Resolvers::Accounts::Login.new
  field :refresh_token, function: Resolvers::Accounts::RefreshToken.new
  field :create_order, function: Resolvers::Orders::Create.new
  field :update_order, function: Resolvers::Orders::Update.new
  field :delete_order, function: Resolvers::Orders::Delete.new
  field :send_feedback, function: Resolvers::Feedbacks::Send.new
end
