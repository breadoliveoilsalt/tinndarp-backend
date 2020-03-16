class Api::BrowsingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def browse
    begin
      decoded_token = decode(user_params[:token])
      user = User.find_by(id: decoded_token[:user_id])
      items = Item.all_unrated_by(user)
      render :json => {
        :items => items
      }
    rescue
      render :json => {
        :errors => "Something went wrong. Please check user token."
      }
    end
  end

end
