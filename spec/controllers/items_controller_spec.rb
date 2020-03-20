require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  # before do
  #   Item.all.destroy_all
  # end

  describe "GET index" do
    it "has a 200 status code" do
      get :index

      expect(response.status).to eq(200)
    end

    it "returns JSON" do
      get :index

      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    describe "the rendered JSON" do
      render_views

      it "represents each of the Items" do
        item_1 = Item.create!
        item_2 = Item.create!

        get :index

        parsed_response = JSON.parse(response.body)
        expect(parsed_response.length).to eq(2)
      end

    end

  end

  describe "GET show" do
    it "has a 200 status code" do
      item_1 = Item.create!
      get :show, params: { id: item_1.id }
      expect(response.status).to eq(200)
    end

    it "returns JSON" do
      item_1 = Item.create!
      get :show, params: { id: item_1.id }

      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    describe "the rendered JSON" do
      render_views

      it "represents the item corresponding to the id passed in as a param in the request" do
        item_1 = Item.create!
        item_2 = Item.create!

        get :show, params: { id: item_2.id }

        parsed_response = JSON.parse(response.body)
        expect(parsed_response["id"]).to eq(item_2.id)
      end

    end

  end
end
