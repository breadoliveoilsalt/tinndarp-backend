require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without an email" do
    user = User.new(password: "password")
    expect(user).to_not be_valid
  end

  it "is not valid without password" do
    user = User.new(email: "email")
    expect(user).to_not be_valid
  end


end
