# frozen_string_literal: true

module Account
  class RefreshToken < Trailblazer::Operation
    step Wrap(SequelTransaction) {
      step :token_not_expired?
      step :token_exists?
      failure :token_invalid!, fail_fast: true

      step :set_expiration_time

      step :generate_access_token

      step :generate_refresh_token

      step :update_refresh_token_in_db
      failure :database_error!

      step :model!
    }

    private

    def token_not_expired?(_options, params:, **)
      @token = Authentication::JsonWebToken.decode(params['refresh_token'])
    end

    def token_exists?(_options, params:, **)
      p @token['device_id']
      @db_token = ::RefreshToken[
          token: Digest::SHA2.hexdigest(params['refresh_token']),
          device_id: @token['device_id'],
          user_id: @token['user']['id']
      ]
    end

    def token_invalid!(options, *)
      options[:errors] = {
        message: 'Token invalid',
        status: 422
      }
    end

    def set_expiration_time(_options, *)
      @access_time = Time.now.utc + Authentication::JsonWebToken::ACCESS_TOKEN_TTL
      @refresh_time = Time.now.utc + Authentication::JsonWebToken::REFRESH_TOKEN_TTL
    end

    def generate_access_token(_options, **)
      @access_token = Authentication::JsonWebToken.encode(
        {
          Authentication::JsonWebToken::USER_IDENTIFIER =>
                @token[Authentication::JsonWebToken::USER_IDENTIFIER.to_s]['id']
        },
        @access_time.to_i
      )
    end

    def generate_refresh_token(_options, **)
      @refresh_token = Authentication::JsonWebToken.encode(
        {
          user: @token[Authentication::JsonWebToken::USER_IDENTIFIER],
          device_id: @db_token.device_id
        },
        @refresh_time.to_i
      )
    end

    def update_refresh_token_in_db(_options, *)
      @db_token.update(token: Digest::SHA2.hexdigest(@refresh_token),
                       expires_in: @refresh_time)
    end

    def database_error!(options, **)
      options[:errors] = {
        message: 'Database error! Please, try again!',
        status: 500
      }
    end

    def model!(options, *)
      options[:model] = OpenStruct.new(
        access_token: @access_token,
        expires_in: @access_time,
        refresh_token: @refresh_token
      )
    end
  end
end
