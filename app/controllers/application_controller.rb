class ApplicationController < ActionController::Base

  ONE_DAY_IN_SECONDS = 60 * 60 * 24

  def user_params
    params.require(:user).permit(:email, :password, :token)
  end

  def renderTokenFor(user)
    token_payload = {:user_id => user.id}
    encode(token_payload)
  end

  def encode(payload, expiration = one_day_from_now)
    payload[:expiration] = expiration
    JWT.encode payload, ENV["SECRET_KEY_BASE"], "HS256"
  end

  def decode(token)
    begin
      JWT.decode token, ENV["SECRET_KEY_BASE"], true, { algorithm: "HS256" }
    rescue
      {}
    end
  end

  def authenticate_user
    decoded_token = decode(user_params[:token])
    if decoded_token[:user_id] && decoded_token[:expiration]
      check_expiration(decoded_token)
    else
      render :json => {
        :logged_in => "false",
        :errors => "Invalid user credential"
      }
    end
  end

 def check_expiration(decoded_token)
   expiration = Time.new(decoded_token[:expiration])
   if expiration < Time.now
     render :json => {
       :logged_in => "true"
     }
   else
    render :json => {
      :logged_in => "false",
      :errors => "Log in has expired"
    }
   end
 end

  private

  def one_day_from_now
    (Time.now + ONE_DAY_IN_SECONDS).to_s
  end

end
