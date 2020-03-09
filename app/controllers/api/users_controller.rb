class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      token_payload = {:user_id => user.id}

      render :json => {
        :logged_in => "true",
        :token => encode(token_payload)
      }
    else
      render :json => {
        :logged_in => "false",
        :errors => user.errors.full_messages
      }
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration
    JWT.encode payload, Rails.application.secrets.secret_key_base, "HS256"
  end

  def decode(token)
    JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: "HS256" }
  end

end
