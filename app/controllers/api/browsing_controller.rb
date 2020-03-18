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
      error_message
    end
  end

  def create_like_or_nope
    begin
      decoded_token = decode(browsing_params[:token])
      if browsing_params[:liked] == "true"
        Like.create(user_id: decoded_token[:user_id], item_id: browsing_params[:item_id])
        render :json => {
          :saved => "true"
        }
      elsif browsing_params[:liked] == "false"
        Nope.create(user_id: decoded_token[:user_id], item_id: browsing_params[:item_id])
        render :json => {
          :saved => "true"
        }
      else 
        render :json => {
          :error => "Not saved"
        }
      end

    rescue
      error_message
    end 
  end

  private

  def browsing_params
    params.require(:browsing).permit(:token, :user_id, :item_id, :liked)
  end

  def error_message
    render :json => {
      :errors => "Something went wrong with the server." 
    }
  end

end
