class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      render :json => {
        :logged_in => "true",
        :token => render_token_for(user)
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
    if decoded_token["user_id"] && decoded_token["expiration"]
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
   expiration = Time.new(decoded_token["expiration"])
   if expiration < Time.now
     render :json => {
       :logged_in => "true",
       :token => user_params[:token]
     }
   else
    render :json => {
      :logged_in => "false",
      :errors => "Log in has expired"
    }
   end
 end

end
