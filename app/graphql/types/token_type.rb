Types::TokenType = GraphQL::ObjectType.define do
  name 'Tokens'

  field :access_token, !types.String, "User's access token"
  field :refresh_token, !types.String, 'Token to refresh access token'
  field :expires_in, !types.String, 'Access token expiration time'
end
