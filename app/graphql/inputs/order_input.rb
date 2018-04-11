Inputs::OrderInput = GraphQL::InputObjectType.define do
  name 'OrderInput'

  argument :client_name, !types.String
  argument :client_phone, !types.String
  argument :start_point, !types.String
  argument :end_point, !types.String
  argument :user_id, types.ID
  argument :tax_id, types.ID
  argument :order_status, types.String
end
