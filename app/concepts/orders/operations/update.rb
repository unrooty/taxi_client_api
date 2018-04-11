# frozen_string_literal: true

class Order::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Policy::Pundit(OrdersPolicy, :access_granted?)

    step Model(Order, :[])

    step Contract::Build(constant: Order::Contract::Create)
  end

  step Nested(Present)

  step Contract::Validate(key: :order)

  step Contract::Persist()
end
