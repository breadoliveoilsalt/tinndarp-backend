require 'rails_helper'

RSpec.describe User, type: :model do

  valid_email = "tony@tony.com"
  valid_password = "tonytony"

  describe "creating a User" do

    it "is not valid without an email" do
      user = User.new(password: valid_password)
      expect(user).to_not be_valid
    end

    it "requires a unique email address" do
      user_2 = User.create(email: valid_email, password: valid_password)
      expect(user_2).to be_valid

      user_2 = User.create(email: valid_email, password: valid_password)
      expect(user_2).to_not be_valid
    end

    it "is not valid without password" do
      user = User.new(email: valid_email)
      expect(user).to_not be_valid
    end

    it "is not valid with a password less than 8 characters" do
      user_1 = User.new(email: valid_email, password: "1234567")
      expect(user_1).to_not be_valid

      user_2 = User.new(email: valid_email, password: "12345678")
      expect(user_2).to be_valid
    end

    it "is not valid without an `@` in the emmail address" do
      user_1 = User.new(email: "tony", password: valid_password)
      expect(user_1).to_not be_valid

      user_2 = User.new(email: "tony.com", password: valid_password)
      expect(user_2).to_not be_valid
    end

    it "defaults to creating a user with non-admin status" do
      user = User.new(email: valid_email, password: valid_password)
      expect(user.admin).to be false
    end

    it "creates an admin if an admin flag is explicitly added" do
      user = User.new(email: valid_email, password: valid_password, admin: true)
      expect(user.admin).to be true
    end

    it "creates a password_digest attirbute that is different from the password" do
      user = User.create(email: valid_email, password: valid_password, admin: true)

      expect(user.password_digest).to be_truthy
      expect(user.password_digest).to_not equal(user.password)
    end

  end

  describe "#likes" do

    it "returns a list of user likes" do
      user = User.create(email: valid_email, password: valid_password)
      like_1 = Like.create(user_id: user.id, item_id: 1)
      like_2 = Like.create(user_id: user.id, item_id: 2)
      user.likes << [like_1, like_2]

      expect(user.likes).to eq([like_1, like_2])
    end

  end

  describe "#liked_items" do

    it "returns a list of liked items" do
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

      user = User.create(email: valid_email, password: valid_password)
      user.liked_items << [item_1, item_2, item_3]

      expect(user.liked_items).to eq([item_1, item_2, item_3])
    end

  end

  describe "#nopes" do

    it "returns a list of user nopes" do
      user = User.create(email: valid_email, password: valid_password)
      nope_1 = Nope.create(user_id: user.id, item_id: 1)
      nope_2 = Nope.create(user_id: user.id, item_id: 2)
      user.nopes << [nope_1, nope_2]

      expect(user.nopes).to eq([nope_1, nope_2])
    end

  end
  
  describe "#noped_items" do

    it "returns a list of noped items" do
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

      user = User.create(email: valid_email, password: valid_password)
      user.noped_items << [item_1, item_2, item_3]

      expect(user.noped_items).to eq([item_1, item_2, item_3])
    end

  end

end
