require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  before(:each) do
    @valid_params =
     { :params => {
         :user => {
            email: "billy@billy.com",
            password: "billybilly"
            }
        }
      }
      ENV['SECRET_KEY_BASE'] = "xyz"
  end

  after(:each) do
    ENV['SECRET_KEY_BASE'] = nil
  end

  describe "POST create" do

    it "has a 200 status code" do
      post :create, @valid_params
      expect(response.status).to eq(200)
    end

    it "returns JSON" do
      post :create, @valid_params

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
            @invalid_params = {:params => {
              email: "billy@billy.com",
              password: "billybilly"
              }
            }

            expect{post :create, @invalid_params}.to raise_error(ActionController::ParameterMissing)
          end

          it "dow not have a token" do
            post :create, @invalid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["token"]).to be_nil
          end

        context "signing in with valid credentials" do

          it "has a key with signed_in set to true" do
            post :create, @valid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["logged_in"]).to eq("true")
          end

          it "has a token" do
            post :create, @valid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["token"]).to be_truthy
          end

        end

      end

    end

  end

  describe "GET authenticate_user_token" do
    render_views
  
    context "the user token is valid" do

       it "should indicate the user is logged_in" do
         valid_token = controller.encode({:user_id => 1})
         strong_params =
           { :params => {
               :user => {
                 :token => valid_token
               }
             }
           }

         get :authenticate_user_token, strong_params

         parsed_response = JSON.parse(response.body)
         expect(parsed_response["logged_in"]).to eq("true")
         expect(parsed_response["token"]).to eq(valid_token)
       end

    end

    context "the user token is invalid" do

       it "should indicate the user is not logged_in" do
         strong_params =
           { :params => {
               :user => {
                 :token => "xyz"
               }
             }
           }

         get :authenticate_user_token, strong_params

         parsed_response = JSON.parse(response.body)
         expect(parsed_response["logged_in"]).to eq("false")
         expect(parsed_response["errors"]).to eq("Invalid user credential")
       end

    end

    context "the user token is expired" do

       it "should indicate the user is not logged_in" do
         twenty_four_hours_ago = (Time.now - (61 * 60 * 24)).to_s
         expired_token = controller.encode({:user_id => 1}, twenty_four_hours_ago)
         strong_params =
           { :params => {
               :user => {
                 :token => expired_token
               }
             }
           }

         get :authenticate_user_token, strong_params

         parsed_response = JSON.parse(response.body)
         expect(parsed_response["logged_in"]).to eq("false")
         expect(parsed_response["errors"]).to eq("Log in has expired")
       end

    end

  end
end
