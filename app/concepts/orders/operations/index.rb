# frozen_string_literal: true

class Order::Index < Trailblazer::Operation
  step Policy::Pundit(OrdersPolicy, :index?)
  step :model!

  private

  def model!(options, current_user:, **)
    options[:model] = current_user.orders
  end
end
