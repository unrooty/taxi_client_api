Types::AccountType = GraphQL::ObjectType.define do
  name 'Account'

  field :id, !types.ID
  field :first_name, !types.String
  field :last_name, !types.String
  field :email, !types.String
  field :phone, !types.String
  field :city, types.String
  field :address, types.String
  field :role, !types.String
  field :language, !types.String
  field :created_at, !types.String
  field :active, !types.Boolean
  field :sign_in_count, !types.Int
  field :current_sign_in_at, types.String
  field :last_sign_in_at, types.String
  field :confirmed_at, types.String
  field :affiliate_id, types.ID
end
