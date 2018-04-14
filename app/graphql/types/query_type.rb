# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # Account queries
  field :deactivate_account, function: Resolvers::Accounts::Deactivate.new

  # Affiliate queries
  field :affiliates, function: Resolvers::Affiliates::Index.new
  field :affiliate, function: Resolvers::Affiliates::Show.new

  # Order queries
  field :orders, function: Resolvers::Orders::Index.new
  field :order, function: Resolvers::Orders::Show.new
  field :send_email_with_orders, function: Resolvers::Orders::SendEmailWithOrders.new
end
