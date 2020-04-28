class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(email: user_params[:email], password: user_params[:password])
    if user.save
      if user_params[:persistent_token] == "true"
        user_token = render_persistent_token_for(user)
      else
        user_token = render_token_for(user)
      end
      render :json => {
        :logged_in => "true",
        :token => user_token,
        :user_email => user.email
      }
    else
      render :json => {
        :logged_in => "false",
        :errors => user.errors.full_messages
      }
    end
  end

  def authenticate_user_token
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

 private

 def check_expiration(decoded_token)
   expiration = Time.parse(decoded_token[:expiration])
   if Time.now <= expiration
    user = User.find_by(id: decoded_token[:user_id])
    render :json => {
      :logged_in => "true",
      :token => user_params[:token],
      :user_email => user.email
    }
   else
    render :json => {
      :logged_in => "false",
      :errors => "Log in has expired"
    }
   end
 end

end
