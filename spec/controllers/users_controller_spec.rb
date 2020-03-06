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

        context "signing in with invalid credentials" do

          before(:each) do
            @invalid_params = {:params => { :user => { :email => "bill@billy.com", :pasword => "" }}}
          end

          it "returns a key with signed_in set to false" do
            post :create, @invalid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["logged_in"]).to eq("false")
          end

          it "renders an errors key if the user credentials are invalid" do
            post :create, @invalid_params
            parsed_response = JSON.parse(response.body)
            expect(parsed_response["errors"]).to be_truthy
          end

          it "renders values with full messages for errors" do
            post :create, @invalid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["errors"]).to eq(["Password can't be blank", "Password is too short (minimum is 8 characters)"])
          end

          it "raises an error if the params do not include a 'user' key" do
            invalid_params = {:params => {
              email: "billy@billy.com",
              password: "billybilly"
              }
            }

            expect{post :create, invalid_params}.to raise_error(ActionController::ParameterMissing)
          end

      end

        context "signing in with valid credentials" do

          it "returns a key with signed_in set to true" do
            post :create, valid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["logged_in"]).to eq("true")
          end

      end

    end

  end

end
