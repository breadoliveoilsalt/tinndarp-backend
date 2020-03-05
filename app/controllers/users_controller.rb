class UsersController < ApplicationController

  def create
    render :json => {:controller => "users"}.to_json
  end
end
