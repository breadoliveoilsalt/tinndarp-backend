class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      token_payload = {:user_id => user.id}

      render :json => {
        :logged_in => "true",
        :token => encode(token_payload)
      }
    else
      render :json => {
        :logged_in => "false",
        :errors => ["Invalid credentials. Please try again."]
      }
   end
 end
  #   user = User.new(user_params)
  #   if user.save
  #     token_payload = {:user_id => user.id}
  #
  #     render :json => {
  #       :logged_in => "true",
  #       :token => encode(token_payload)
  #     }
  #   else
  #     render :json => {
  #       :logged_in => "false",
  #       :errors => user.errors.full_messages
  #     }
  #   end
  # end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration
    JWT.encode payload, ENV["SECRET_KEY_BASE"], "HS256"
  end

  def decode(token)
    JWT.decode token, ENV["SECRET_KEY_BASE"], true, { algorithm: "HS256" }
  end

end
