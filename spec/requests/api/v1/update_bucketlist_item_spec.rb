require "rails_helper"

RSpec.describe "Update Bucketlist Item", type: :request do
  include_context "before suite"

  describe "PUT /bucketlists/:id/items/:id" do
    it "fails with an invalid token" do
      test_with_invalid_token(
        :put,
        "/api/v1/bucketlists/#{bucketlist.id}/items/#{item.id}"
      )
    end

    it "fails with an invalid bucketlist ID" do
      test_with_invalid_bucketlist(
        :put,
        "/api/v1/bucketlists/0/items/#{item.id}"
      )
    end

    it "should not update when the name field is empty" do
      token = api_token
      put(
        "/api/v1/bucketlists/#{bucketlist.id}/items/#{item.id}",
        { name: "" },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(400)
      expect(Item.count).to eq(12)
    end

    it "should not update an item if the specified item id is not found" do
      token = api_token
      put(
        "/api/v1/bucketlists/#{bucketlist.id}/items/0",
        { name: "Do something", bucketlist_id: bucketlist.id },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(404)
      expect(Item.count).to eq(12)
    end

    it "should update specified item when valid name and token are provided" do
      token = api_token
      put(
        "/api/v1/bucketlists/#{bucketlist.id}/items/#{item.id}",
        { name: "Do something", bucketlist_id: bucketlist.id },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(201)
      expect(Item.count).to eq(12)
    end
  end
end
