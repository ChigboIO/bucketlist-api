require "rails_helper"

RSpec.describe "Single Bucketlist", type: :request do
  include_context "before suite"

  describe "GET /bucketlists/:id" do
    it "fails with an invalid token" do
      test_with_invalid_token(:get, "/api/v1/bucketlists/#{bucketlist.id}")
    end

    it "returns returns 404 error when given bucketlist id not found" do
      token = api_token
      get "/api/v1/bucketlists/0", nil, HTTP_AUTHORIZATION: token

      expect(response).to have_http_status(404)
    end

    it "returns items by the user with valid token provided" do
      token = api_token
      get "/api/v1/bucketlists/#{bucketlist.id}", nil, HTTP_AUTHORIZATION: token

      expect(response).to have_http_status(200)
    end
  end
end
