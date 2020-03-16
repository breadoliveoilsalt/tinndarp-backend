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

end
