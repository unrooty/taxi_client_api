# frozen_string_literal: true

class Home::FeedbackMail < Trailblazer::Operation
  step Model(Feedback, :new)

  step Contract::Build(constant: Feedback::Contract::FeedbackMailSend)

  step Wrap(SequelTransaction) {
    step Contract::Validate(key: :feedback)

    step Contract::Persist()

    step :send_feedback_mail
  }

  private

  def send_feedback_mail(_options, model:, **)
    UserMailer.feedback_mail(model).deliver
  end
end
