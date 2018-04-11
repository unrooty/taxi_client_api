module Resolvers
  class BaseResolver < GraphQL::Function
    include Handler
  end
end
