# frozen_string_literal: true

class Order::Delete < Trailblazer::Operation
  step Model(Order, :[])

  step Policy::Pundit(OrdersPolicy, :access_granted?)

  step Wrap(SequelTransaction) {
    success :unassign_car!

    step :delete!
  }

  private

  def unassign_car!(_options, model:, **)
    model.car&.update(car_status: 'Free')
  end

  def delete!(_options, model:, **)
    model.destroy
  end
end
