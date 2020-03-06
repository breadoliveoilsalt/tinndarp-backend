class Api::UsersController < ApplicationController

  def test
    render :json => {:controller => "You made it to the users controller!"}.to_json
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => {
        :logged_in => "true"
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

end
