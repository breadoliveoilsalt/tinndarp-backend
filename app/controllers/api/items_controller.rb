class Api::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    items = Item.all
    render :json => items
  end

  def show
    item = Item.find_by(id: params[:id])
    render :json => item
  end

  def browse
    begin
      decoded_token = decode(user_params[:token])
      user = User.find_by(id: decoded_token[:user_id])

    rescue
      render :json => {
        :errors => "Something went wrong. Please check user token."
      }
    end
  end

end
