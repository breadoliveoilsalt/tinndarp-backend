require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST create" do
    it "has a 200 status code" do

      post '/api/sign_up', :params => {:message => "Hey there"}

      expect(response.status).to eq(200)
    end

    xit "returns JSON" do
      get :index

      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    xdescribe "the rendered JSON" do
      render_views

      # it "represents each of the items" do
      #   item_1 = item.create!
      #   item_2 = item.create!
      #
      #   get :index
      #
      #   parsed_response = json.parse(response.body)
      #   expect(parsed_response.length).to eq(2)
      # end

    end

  end

end
