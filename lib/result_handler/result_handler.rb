# frozen_string_literal: true

module ResultHandler
  include Matcher

  def handle_successful(result)
    match(%w[success unauthorized not_found]).call(result) do |m|
      m.success do
        model_return(result)
        yield if block_given?
      end
      m.unauthorized { unauthorized_error }
      m.not_found { not_found_error }
    end
  end

  def handle_invalid(result)
    match(%w[invalid fail]).call(result) do |m|
      m.invalid do
        error_return(result)
        yield if block_given?
      end
      m.fail { failure(result) }
    end
  end

  def unauthorized_error
    GraphQL::ExecutionError.new('Forbidden')
  end

  def not_found_error
    GraphQL::ExecutionError.new('Not Found')
  end

  def failure(result)
    GraphQL::ExecutionError.new(result[:errors][:message])
  end

  def model_return(result)
    @model = result[:model]
  end

  def error_return(result)
    @errors = GraphQL::ExecutionError.new(
      result['contract.default'].errors.full_messages.join(', ')
    )
  end
end
