class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      render :json => {
        :logged_in => "true",
        :token => renderTokenFor(user)
      }
    else
      render :json => {
        :logged_in => "false",
        :errors => user.errors.full_messages
      }
    end
  end

end
