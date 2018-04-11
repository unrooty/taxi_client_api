# frozen_string_literal: true

class Order::Show < Trailblazer::Operation
  step Policy::Pundit(OrdersPolicy, :access_granted?)

  step Model(Order, :[])
end
