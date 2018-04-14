Inputs::AccountUpdateInput = GraphQL::InputObjectType.define do
  name 'AccountUpdateInput'

  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :email, !types.String
  argument :password, types.String
  argument :password_confirmation, types.String
  argument :current_password, !types.String
  argument :phone, !types.String
  argument :city, types.String
  argument :address, types.String
  argument :language, types.String
  argument :affiliate_id, types.ID
end
