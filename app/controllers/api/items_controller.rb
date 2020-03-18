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

end
