require "rails_helper"

RSpec.describe "Update Bucketlist", type: :request do
  include_context "before suite"

  describe "PUT /bucketlists/:id" do
    it "fails with an invalid token" do
      test_with_invalid_token(:put, "/api/v1/bucketlists/#{bucketlist.id}")
    end

    it "returns 404 status when bucketlist id is not found" do
      token = api_token
      put(
        "/api/v1/bucketlists/0",
        { name: "As a developer" },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(404)
      expect(Bucketlist.count).to eq(6)
      expect(Bucketlist.find(bucketlist.id).name).to eq(bucketlist.name)
    end

    it "should not update when the name field is empty" do
      token = api_token
      put(
        "/api/v1/bucketlists/#{bucketlist.id}",
        { name: "" },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(400)
      expect(Bucketlist.find(bucketlist.id).name).to eq(bucketlist.name)
    end

    it "returns items by the user with valid token provided" do
      token = api_token
      put(
        "/api/v1/bucketlists/#{bucketlist.id}",
        { name: "As a developer" },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(201)
      expect(Bucketlist.count).to eq(6)
      expect(Bucketlist.find(bucketlist.id).name).to eq("As a developer")
    end
  end
end
