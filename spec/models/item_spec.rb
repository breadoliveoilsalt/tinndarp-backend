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
      expect{@item.more_info_URL}.to_not raise_error(NoMethodError)
    end

  end

end
