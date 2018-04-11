# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :affiliates, function: Resolvers::Affiliates::Index.new
  field :affiliate, function: Resolvers::Affiliates::Show.new
  field :orders, function: Resolvers::Orders::Index.new
end
