# require 'rails_helper'

# RSpec.describe Api::ComparingController, type: :controller do

#   describe "GET compare" do

#     @item_1 = Item.create(
#       name: "SAGSTUA",
#       image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
#       price: "149.00",
#       description: "Bed frame, black, Full",
#       more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
#     )

#     @item_2 = Item.create(
#       name: "MALM",
#       image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
#       price: "199.00",
#       description: "Bed frame, high, black-brown, Luröy, Queen",
#       more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
#     )

#     @item_3 = Item.create(
#       name: "BUSKBO",
#       image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
#       price: "130.00",
#       description: "Armchair, rattan",
#       more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
#     )

#     it "finds the user based on the token and calls #find_liked_items_in_common_with on the user" do
#       # user = stub_model User, 
#       #   :id => 1,
#       #   :find_liked_items_in_common_with => [@item_1, @item_2, @item_3]

#       user = instance_double("User")
#       allow(user).to receive(:id).and_return(1)
#       comparison_email = "someEmail@email.com"

#       valid_params = {
#         :comparing => {
#           :token => controller.encode({:user_id => user.id}),
#           :compare_to => comparison_email 
#         }
#       }

#       get :compare, valid_params

#       expect(user).to receive(:find_liked_items_in_common_with).once
#     end

#     it "returns a 404 status code if #find_liked_items_in_common_with returns nil" do

#     end

#     it "returns an error message if #find_liked_items_in_common_with returns nil" do

#     end

#   end

# end