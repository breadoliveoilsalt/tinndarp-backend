class ApplicationController < ActionController::Base

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def renderTokenFor(user)
    token_payload = {:user_id => user.id}
    encode(token_payload)
  end

  def encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration
    JWT.encode payload, ENV["SECRET_KEY_BASE"], "HS256"
  end

  def decode(token)
    JWT.decode token, ENV["SECRET_KEY_BASE"], true, { algorithm: "HS256" }
  end

end
