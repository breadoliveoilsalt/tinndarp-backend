require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  def valid_params
    {:params => {
       :user => {
          email: "billy@billy.com",
          password: "billybilly"
          }
      }
    }
  end

  describe "POST create" do
    it "has a 200 status code" do
      post :create, valid_params
      expect(response.status).to eq(200)
    end

    it "returns JSON" do
      post :create, valid_params

      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    describe "the rendered JSON" do
      render_views

      it "renders an errors key if the user credentials are invalid" do
        post :create, {:params => { :user => { :email => "", :pasword => "" }}}

        parsed_response = JSON.parse(response.body)
        expect(parsed_response["errors"]).to be_truthy
      end

      it "renders values with full messages for errors" do
        post :create, {:params => { :user => { :email => "bill@billy.com", :pasword => "" }}}

        parsed_response = JSON.parse(response.body)

        expect(parsed_response["errors"]).to eq(["Password can't be blank", "Password is too short (minimum is 8 characters)"])
      end

    end
  end
end
