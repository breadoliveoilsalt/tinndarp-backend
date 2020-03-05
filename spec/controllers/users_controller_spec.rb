require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST create" do
    it "has a 200 status code" do
      get :index

      expect(response.status).to eq(200)
    end

    it "returns JSON" do
      get :index

      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    xdescribe "the rendered JSON" do
      render_views

      # it "represents each of the Items" do
      #   item_1 = Item.create!
      #   item_2 = Item.create!
      #
      #   get :index
      #
      #   parsed_response = JSON.parse(response.body)
      #   expect(parsed_response.length).to eq(2)
      # end

    end

  end

end
