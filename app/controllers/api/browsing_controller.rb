class Api::BrowsingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def browse
    begin
      decoded_token = decode(browsing_params[:token])
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

  def create_like_or_nope
    decoded_token = decode(browsing_params[:token])
    if browsing_params[:liked] == "true"
      Like.create(user_id: decoded_token[:user_id], item_id: browsing_params[:item_id])
    elsif browsing_params[:liked] == "false"
      Nope.create(user_id: decoded_token[:user_id], item_id: browsing_params[:item_id])
    end
  end

  private

  def browsing_params
    params.require(:browsing).permit(:token, :user_id, :item_id, :liked)
  end

end
