require "rails_helper"

RSpec.describe "Create Bucketlist Item", type: :request do
  include_context "before suite"

  describe "POST /bucketlists/:id/items" do
    it "fails with an invalid token" do
      test_with_invalid_token(
        :post,
        "/api/v1/bucketlists/#{bucketlist.id}/items/"
      )
    end

    it "fails with an invalid bucketlist ID" do
      test_with_invalid_bucketlist(:post, "/api/v1/bucketlists/0/items/")
    end

    it "should not create when the name field is empty" do
      token = api_token
      post(
        "/api/v1/bucketlists/#{bucketlist.id}/items/",
        { name: "" },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(400)
      expect(Item.count).to eq(12)
    end

    it "should create an item when valid name and token are provided" do
      token = api_token
      post(
        "/api/v1/bucketlists//#{bucketlist.id}/items",
        { name: "Do something", bucketlist_id: bucketlist.id },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(201)
      expect(Item.count).to eq(13)
      expect(Item.last.bucketlist.name).to eq(bucketlist.name)
    end
  end
end
