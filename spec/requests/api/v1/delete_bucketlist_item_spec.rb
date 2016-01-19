require "rails_helper"

RSpec.describe "Delete Bucketlist", type: :request do
  include_context "before suite"

  describe "DELETE /bucketlists/:id/items/:id" do
    it "fails with an invalid token" do
      test_with_invalid_token(
        :delete,
        "/api/v1/bucketlists/#{bucketlist.id}/items/#{item.id}"
      )
    end

    it "fails with an invalid bucketlist ID" do
      test_with_invalid_bucketlist(
        :delete,
        "/api/v1/bucketlists/0/items/#{item.id}"
      )
    end

    it "returns 404 status when bucketlist id is not found" do
      token = api_token
      delete(
        "/api/v1/bucketlists/#{bucketlist.id}/items/0",
        nil,
        HTTP_AUTHORIZATION: token
      )
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(404)
      expect(json_response).to include("error")
      expect(Item.count).to eq(12)
    end

    it "deletes the identified bucketlist when valid token is provided" do
      token = api_token
      delete(
        "/api/v1/bucketlists/#{bucketlist.id}/items/#{item.id}",
        nil,
        HTTP_AUTHORIZATION: token
      )
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response).to include("message")
      expect(Item.count).to eq(11)
      expect(Item.find_by_id(item.id)).to be_nil
    end
  end
end
