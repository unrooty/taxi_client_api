# frozen_string_literal: true

module Authentication
  module AuthHelpers
    def authenticate_request!(headers)
      token_present?(headers)
      token_expired?
      check_account
    end

    private

    def current_user
      @user
    end

    def token_present?(headers)
      if headers['Access-Token'].present?
        return @token = headers['Access-Token']
      end
      raise Handler::RequestError.new('Token absent', 422)
    end

    def token_expired?
      token = JsonWebToken.decode(@token)
      raise Handler::RequestError.new('Token invalid', 401) unless token
      @user = User[token['user']]
    end

    def check_account
      return @user if @user.active
      error!('Account deactivated!', 403)
      if !@user.confirmed_at || (@user.confirmation_sent_at + 12.hours < Time.now)
        raise Handler::RequestError.new('Account not confirmed!', 403)
      end
    end
  end
end
