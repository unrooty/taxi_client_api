# frozen_string_literal: true

module Account
  class EmailSender < Trailblazer::Operation
    class FindUser < Trailblazer::Operation
      step :find_user
      failure :user_not_exists!

      private

      def find_user(options, params:, **)
        options[:model] = User[email: params['email']]
      end

      def user_not_exists!(options, params:, **)
        options[:errors] = {
          message: "User with #{params['email']} doesn't exists.",
          status: 422
        }
      end
    end

    class Activation < Trailblazer::Operation
      step Nested(Account::EmailSender::FindUser)

      step :send_email

      def send_email(_options, model:, **)
        UserMailer.activation_email(model).deliver
      end
    end

    class PasswordReset < Trailblazer::Operation
      step Nested(Account::EmailSender::FindUser)

      step :send_email

      def send_email(_options, model:, **)
        UserMailer.reset_password_email(model).deliver
        model.update(reset_password_sent_at: Time.now)
      end
    end
  end
end
