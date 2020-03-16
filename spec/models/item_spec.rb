require 'rails_helper'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe Item, type: :model do

  before(:each) do
    @item = Item.new
  end

  describe "the properties of an Item" do

    it "an Item has an image_url" do
      expect{@item.image_url}.to_not raise_error(NoMethodError)
    end

    it "an Item has a name" do
      expect{@item.name}.to_not raise_error(NoMethodError)
    end

    it "an Item has a price" do
      expect{@item.price}.to_not raise_error(NoMethodError)
    end

    it "an Item has a description" do
      expect{@item.description}.to_not raise_error(NoMethodError)
    end

    it "an Item has a link for more information " do
      expect{@item.more_info_url}.to_not raise_error(NoMethodError)
    end

  end

  describe "#likes" do

    it "returns a list of likes" do
      item = Item.create(
        name: "SAGSTUA",
        image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
        price: "149.00",
        description: "Bed frame, black, Full",
        more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
      )
      like_1 = Like.create(user_id: 1, item_id: item.id)
      like_2 = Like.create(user_id: 2, item_id: item.id)
      item.likes << [like_1, like_2]

      expect(item.likes).to eq([like_1, like_2])
    end

  end

  # describe "#liked_items" do
  #
  #   it "returns a list of liked items" do
  #
  #     item_2 = Item.create(
  #       name: "MALM",
  #       image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
  #       price: "199.00",
  #       description: "Bed frame, high, black-brown, Luröy, Queen",
  #       more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
  #     )
  #
  #     item_3 = Item.create(
  #       name: "BUSKBO",
  #       image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
  #       price: "130.00",
  #       description: "Armchair, rattan",
  #       more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
  #     )
  #
  #     user = User.create(email: valid_email, password: valid_password)
  #     user.liked_items << [item_1, item_2, item_3]
  #
  #     expect(user.liked_items).to eq([item_1, item_2, item_3])
  #   end
  #
  # end
  #
  # describe "#nopes" do
  #
  #   it "returns a list of user nopes" do
  #     user = User.create(email: valid_email, password: valid_password)
  #     nope_1 = Nope.create(user_id: user.id, item_id: 1)
  #     nope_2 = Nope.create(user_id: user.id, item_id: 2)
  #     user.nopes << [nope_1, nope_2]
  #
  #     expect(user.nopes).to eq([nope_1, nope_2])
  #   end
  #
  # end
  #
  # describe "#noped_items" do
  #
  #   it "returns a list of noped items" do
  #     item_1 = Item.create(
  #       name: "SAGSTUA",
  #       image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
  #       price: "149.00",
  #       description: "Bed frame, black, Full",
  #       more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
  #     )
  #
  #     item_2 = Item.create(
  #       name: "MALM",
  #       image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
  #       price: "199.00",
  #       description: "Bed frame, high, black-brown, Luröy, Queen",
  #       more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
  #     )
  #
  #     item_3 = Item.create(
  #       name: "BUSKBO",
  #       image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
  #       price: "130.00",
  #       description: "Armchair, rattan",
  #       more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
  #     )
  #
  #     user = User.create(email: valid_email, password: valid_password)
  #     user.noped_items << [item_1, item_2, item_3]
  #
  #     expect(user.noped_items).to eq([item_1, item_2, item_3])
  #   end
  #
  # end

end
