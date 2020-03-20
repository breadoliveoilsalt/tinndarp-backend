require 'rails_helper'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe Item, type: :model do

  describe "the properties of an Item" do

    before(:each) do
      @item = Item.new
    end

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

  describe "#liking_users" do

    it "returns a list of liking users" do
      item = Item.create(
        name: "SAGSTUA",
        image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
        price: "149.00",
        description: "Bed frame, black, Full",
        more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
      )
      user_1 = User.create(email: "email1@email.com", password: "password")
      user_2 = User.create(email: "email2@email.com", password: "password")
      user_3 = User.create(email: "email3@email.com", password: "password")
      item.liking_users << [user_1, user_2, user_3]

      expect(item.liking_users).to eq([user_1, user_2, user_3])
    end

  end

  describe "#nopes" do

    it "returns a list of nopes" do
      item = Item.create(
        name: "SAGSTUA",
        image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
        price: "149.00",
        description: "Bed frame, black, Full",
        more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
      )
      nope_1 = Nope.create(user_id: 1, item_id: item.id)
      nope_2 = Nope.create(user_id: 2, item_id: item.id)
      item.nopes << [nope_1, nope_2]

      expect(item.nopes).to eq([nope_1, nope_2])
    end

  end

  describe "#noping_users" do

    it "returns a list of noping users" do
      item = Item.create(
        name: "SAGSTUA",
        image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
        price: "149.00",
        description: "Bed frame, black, Full",
        more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
      )
      user_1 = User.create(email: "email1@email.com", password: "password")
      user_2 = User.create(email: "email2@email.com", password: "password")
      user_3 = User.create(email: "email3@email.com", password: "password")
      item.noping_users << [user_1, user_2, user_3]

      expect(item.noping_users).to eq([user_1, user_2, user_3])
    end

  end

  describe ".all_unrated_by" do

    it "returns a list of items unrated by the user" do
      user = User.create(email: "email1@email.com", password: "password")

      item_1 = Item.create(
        name: "SAGSTUA",
        image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
        price: "149.00",
        description: "Bed frame, black, Full",
        more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
      )

      item_2 = Item.create(
        name: "MALM",
        image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
        price: "199.00",
        description: "Bed frame, high, black-brown, Luröy, Queen",
        more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
      )

      item_3 = Item.create(
        name: "BUSKBO",
        image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
        price: "130.00",
        description: "Armchair, rattan",
        more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
      )

      item_4 = Item.create(
        name: "SKOGSTA",
        image_url: "https://www.ikea.com/us/en/images/products/skogsta-bench__0365463_PE548271_S5.JPG?f=s",
        price: "79.00",
        description: "Bench, acacia, 47 1/4 \"",
        more_info_url: "https://www.ikea.com/us/en/p/skogsta-bench-acacia-30297957/"
      )

      item_5 = Item.create(
        name: "KNOPPARP",
        image_url: "https://www.ikea.com/us/en/images/products/knopparp-3-seat-sofa__0713945_PE729859_S5.JPG?f=s",
        price: "149.00",
        description: "Sofa, Knisa light gray",
        more_info_url: "https://www.ikea.com/us/en/p/knopparp-sofa-knisa-light-gray-20424625/"
      )

      user.liked_items << [item_1, item_2]
      user.noped_items << [item_3]

      expect(Item.all_unrated_by(user)).to eq([item_4, item_5])
    end

  end

end
