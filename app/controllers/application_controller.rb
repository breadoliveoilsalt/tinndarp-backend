class ApplicationController < ActionController::Base

  ONE_DAY_IN_SECONDS = 60 * 60 * 24

  def user_params
    params.require(:user).permit(:email, :password, :token)
  end

  def render_token_for(user)
    token_payload = {:user_id => user.id}
    encode(token_payload)
  end

  def encode(payload, expiration = one_day_from_now)
    payload[:expiration] = expiration
    JWT.encode payload, ENV["SECRET_KEY_BASE"], "HS256"
  end

  def decode(token)
    begin
      full_decoding = JWT.decode token, ENV["SECRET_KEY_BASE"], true, { algorithm: "HS256" }
      full_decoding[0]
    rescue
      {}
    end
  end

  private

  def one_day_from_now
    (Time.now + ONE_DAY_IN_SECONDS).to_s
  end

end
