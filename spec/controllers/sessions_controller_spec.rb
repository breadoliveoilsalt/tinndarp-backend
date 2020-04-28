require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  before(:each) do
    @valid_params =
     { :params => {
         :user => {
            email: "billy@billy.com",
            password: "billybilly"
            }
        }
      }
    @user = User.create(email: "billy@billy.com", password: "billybilly")
    ENV["SECRET_KEY_BASE"] = "XYZdalfkjasdpfoijasdf1232"
  end

  after(:each) do
    @user.destroy
    ENV["SECRET_KEY_BASE"] = nil
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

          it "renders an error message that the credientials are invalid" do
            post :create, @invalid_params

            parsed_response = JSON.parse(response.body)

            expect(parsed_response["errors"]).to eq(["Invalid credentials. Please try again."])
          end

          it "raises an error if the params do not include a 'user' key" do
            @invalid_params = {:params => {
              email: "billy@billy.com",
              password: "billybilly"
              }
            }

            expect{post :create, @invalid_params}.to raise_error(ActionController::ParameterMissing)
          end

          it "does not have a token" do
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

          it "has a token set to expire in 24 hours by default" do
            post :create, @valid_params

            parsed_response = JSON.parse(response.body)

            token = parsed_response["token"]
            expect(token).to be_truthy

            just_over_24_hours_from_now = (Time.now + (61 * 60 * 24)).to_s
            just_under_24_hours_from_now = (Time.now + (59 * 60 * 24)).to_s
            decoded_token = controller.decode(token)
            expect(Time.parse(decoded_token[:expiration])).to be < Time.parse(just_over_24_hours_from_now)
            expect(Time.parse(decoded_token[:expiration])).to be > Time.parse(just_under_24_hours_from_now)
          end

          it "provides a token set to expire 10 years from now, if the params include persistent_token set to true" do 
            valid_params = { 
              :params => {
                :user => {
                  email: "billy@billy.com",
                  password: "billybilly",
                  persistent_token: true
                }
              }
            }

            post :create, valid_params

            parsed_response = JSON.parse(response.body)
            token = parsed_response["token"]
            expect(token).to be_truthy

            just_under_10_years_from_now = (Time.now + (59 * 60 * 24 * 3650)).to_s
            decoded_token = controller.decode(token)
            expect(Time.parse(decoded_token[:expiration])).to be > Time.parse(just_under_10_years_from_now)
          end

        end

      end

    end

  end

end
