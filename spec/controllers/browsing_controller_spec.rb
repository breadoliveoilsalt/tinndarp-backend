require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  describe "GET browse" do

    before(:each) do
      @user = User.create(email: "email1@email.com", password: "password")

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

      @user.liked_items << @item_1
    end

    it "renders JSON with the user's unrated items if the user has a valid token" do

      valid_token = controller.encode({:user_id => @user.id})
      strong_params =
        { :params => {
            :user => {
              :token => valid_token
            }
          }
        }

       get :browse, strong_params

       expected_items = JSON.stringify([@item_2, @item_3])
       parsed_response = JSON.parse(response.body)
       expect(parsed_response["items"]).to eq(expected_items)
    end
  end




end
