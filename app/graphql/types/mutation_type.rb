# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :login, function: Resolvers::Accounts::Login.new
  field :refresh_token, function: Resolvers::Accounts::RefreshToken.new
  field :create_order, function: Resolvers::Orders::Create.new
end
