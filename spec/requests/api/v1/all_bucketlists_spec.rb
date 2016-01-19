require "rails_helper"

RSpec.describe "Bucketlists", type: :request do
  include_context "before suite"

  describe "GET /bucketlists" do
    it "fails with an invalid token" do
      test_with_invalid_token(:get, "/api/v1/bucketlists/")
    end

    it "returns items whose name match my search parameter" do
      token = api_token
      get "/api/v1/bucketlists/?p=e", nil, HTTP_AUTHORIZATION: token

      expect(response).to have_http_status(200)
    end

    it "returns a given number of items in a given page" do
      token = api_token
      get "/api/v1/bucketlists/?page=1&limit=2", nil, HTTP_AUTHORIZATION: token

      expect(response).to have_http_status(200)
    end

    it "returns items by the user with valid token provided" do
      token = api_token
      get "/api/v1/bucketlists", nil, HTTP_AUTHORIZATION: token

      expect(response).to have_http_status(200)
    end
  end
end
