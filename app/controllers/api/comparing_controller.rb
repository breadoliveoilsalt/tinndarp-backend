class Api::ComparingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def compare
    begin
      decoded_token = decode(browsing_params[:token])
      user = User.find_by(id: decoded_token[:user_id])
      compared_user = User.find_by(email: browsing_params[:compare_to])
      if !compared_user
        render :json => {
              :errors => ["Record for requested comparison user does not exist"]
              },
              :status => 404
      else 
        common_items = user.find_liked_items_in_common_with(compared_user)
        render :json => {
          :user_email => user.email,
          :successful_comparison_to => browsing_params[:compare_to],
          :common_items => common_items
        }
      end
    rescue
      render :json => {
          :errors => ["Sorry, there was an error trying to compare", "Token may be invalid", "Try logging in again", "Other user may not have been findable"]
        }, :status => 404
    end

  end

  private

  def comparing_params
    params.require(:comparing).permit(:token, :compare_to)
  end

end