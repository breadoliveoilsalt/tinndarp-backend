require 'rails_helper'

RSpec.describe User, type: :model do

  describe "creating a User" do

    valid_email = "tony@tony.com"
    valid_password = "tonytony"

    it "is not valid without an email" do
      user = User.new(password: valid_password)
      expect(user).to_not be_valid
    end

    it "requires a unique email address" do
      user_1 = User.create(email: valid_email, password: valid_password)
      expect(user_1).to be_valid

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

    xit "does not create a password attribute" do


    end

    xit "creates a password_digest attirbute that is different from the password" do


    end
  end

end
