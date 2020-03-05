require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe "POST create" do
    it "has a 200 status code" do
      post :create
      expect(response.status).to eq(200)
    end

    it "returns JSON" do
      post :create

      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    describe "the rendered JSON" do
      render_views

      it "renders an error if the user credentials are invalid" do
        post :create, :params => {
                        :user => {
                          :email => "",
                          :pasword => ""
                        }
                      }

        parsed_response = json.parse(response.body)
        expect(parsed_response.error).to be_truthy
      end
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
