Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'

  field :id, !types.ID
  field :client_name, !types.String
  field :client_phone, !types.String
  field :start_point, !types.String
  field :end_point, !types.String
  field :user_id, types.ID
  field :tax_id, types.ID
  field :order_status, types.String
end
