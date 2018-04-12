TaxiClientApiSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
end

GraphQL::Errors.configure(TaxiClientApiSchema) do
  rescue_from Handler::RequestError do |e|
    GraphQL::ExecutionError.new(e.message)
  end
end
