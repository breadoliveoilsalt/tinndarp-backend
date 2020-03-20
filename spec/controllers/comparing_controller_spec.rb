require 'rails_helper'

RSpec.describe Api::ComparingController, type: :controller do

  describe "GET compare" do

    before(:each) do
      @item_1 = Item.create(
        name: "SAGSTUA",
        image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
        price: "149.00",
        description: "Bed frame, black, Full",
        more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
      )

      @item_2 = Item.create(
        name: "MALM",
        image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
        price: "199.00",
        description: "Bed frame, high, black-brown, Luröy, Queen",
        more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
      )

      @item_3 = Item.create(
        name: "BUSKBO",
        image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
        price: "130.00",
        description: "Armchair, rattan",
        more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
      )
    end

    it "returns json with a list of commonly liked items if two users have liked items in common" do
      user = User.create(email: "billy@billy.com", password: "password")
      user.liked_items << [@item_1, @item_2]
      compared_user = User.create(email: "johnny@johnny.com", password: "password")
      compared_user.liked_items << [@item_1, @item_2]

      valid_params = {
        :params => {
          :comparing => {
            :token => controller.encode({:user_id => user.id}),
            :compare_to => compared_user.email 
          }
        }
      }

      get :compare, valid_params

      parsed_response = JSON.parse(response.body)
      expected_items = [JSON.parse(@item_1.to_json), JSON.parse(@item_2.to_json)]
      expect(parsed_response["common_items"]).to eq(expected_items)
    end

    it "returns a 404 status code with error messages if the compared_to user cannot be found" do
      user = User.create(email: "billy@billy.com", password: "password")
      user.liked_items << [@item_1, @item_2]
      valid_params = {
        :params => {
          :comparing => {
            :token => controller.encode({:user_id => user.id}),
            :compare_to => "invalid_email@email.com" 
          }
        }
      }

      get :compare, valid_params

      expect(response.status).to eq(404)
      expect(response.body["errors"]).to be_truthy 
    end

    it "returns a 404 status code with error messages if user token is invalid" do
      user = User.create(email: "billy@billy.com", password: "password")
      user.liked_items << [@item_1, @item_2]
      invalid_user_token = "xyz"
      compared_user = User.create(email: "johnny@johnny.com", password: "password")
      compared_user.liked_items << [@item_1, @item_2]
      valid_params = {
        :params => {
          :comparing => {
            :token => invalid_user_token,
            :compare_to => compared_user.email 
          }
        }
      }

      get :compare, valid_params

      expect(response.status).to eq(404)
      expect(response.body["errors"]).to be_truthy 
    end

  end

end