# frozen_string_literal: true

class Order::Create < Trailblazer::Operation
  step Model(Order, :new)

  step Contract::Build(constant: Order::Contract::Create)

  step Contract::Validate(key: :order)

  step Wrap(SequelTransaction) {
    step :check_user_presence

    success :assign_user_to_order

    step :set_default_tax_to_order

    step Contract::Persist()
  }

  private

  def check_user_presence(options, headers:, **)
    if headers['Access-Token'].present?
      check_token(headers['Access-Token'], options)
    else
      @current_user = nil
      true
    end
  end

  def check_token(token, options)
    payload = Authentication::JsonWebToken.decode(token)
    if payload && payload['user']
      @current_user = User[payload['user']]
    else
      options[:errors] = { message: 'Token invalid', status: 401 }
      false
    end
  end

  def set_default_tax_to_order(_options, model:, **)
    model.tax_id = Tax.where(by_default: true).last.id
  end

  def assign_user_to_order(_options, model:, **)
    model.user_id = (@current_user&.id)
  end
end
