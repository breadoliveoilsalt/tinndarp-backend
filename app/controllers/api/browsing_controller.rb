class Api::BrowsingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def browse
    render :json => {
      :errors => "Something went wrong. Please check user token."
    }
    # begin
    #   decoded_token = decode(user_params[:token])
    #   user = User.find_by(id: decoded_token[:user_id])
    #
    # rescue
    #   render :json => {
    #     :errors => "Something went wrong. Please check user token."
    #   }
    # end
  end

end
