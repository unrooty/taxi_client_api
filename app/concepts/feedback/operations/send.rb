# frozen_string_literal: true

class Feedback::Send < Trailblazer::Operation
  step Model(Feedback, :new)

  step Contract::Build(constant: Feedback::Contract::Send)
  step :hi
  def hi(options, params:, **)
    p params
    # p '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  end
  step Contract::Validate(key: :feedback)

  step Wrap(SequelTransaction) {

    step Contract::Persist()

    step :send_feedback_mail
  }

  private

  def send_feedback_mail(_options, model:, **)
    UserMailer.feedback_mail(model).deliver
  end
end
