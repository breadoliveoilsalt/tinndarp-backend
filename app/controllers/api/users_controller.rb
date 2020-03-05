class Api::UsersController < ApplicationController

  def test
    render :json => {:controller => "You made it to the users controller!"}.to_json
  end

  def create
    render :json => {:controller => "user data"}
  end
end
