module Handler
  # MATCHERS = []
  def handle(result)
    return result[:model] if result.success?
    return failure(result) if result.failure?
    error!('Something went wrong! Please, try again or contact the developer!')
  end

  def failure(result)
    return error!('Forbidden') if result['result.policy.default']&.failure?
    return error!('Not Found') if result['result.model']&.failure?
    return error!(result[:errors][:message]) if result[:errors]
    error!(result['contract.default'].errors.full_messages.join(', '))
  end

  def error!(message)
    GraphQL::ExecutionError.new(message)
  end
end
