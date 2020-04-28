class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
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
        :errors => ["Invalid credentials. Please try again."]
      }
   end
 end

end
