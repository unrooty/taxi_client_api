Types::AffiliateType = GraphQL::ObjectType.define do
  name 'Affiliate'

  field :id, !types.ID
  field :name, !types.String
  field :address, !types.String
end
