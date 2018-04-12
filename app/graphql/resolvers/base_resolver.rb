# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Function
    include Handler
    include Authentication::AuthHelpers
  end
end
