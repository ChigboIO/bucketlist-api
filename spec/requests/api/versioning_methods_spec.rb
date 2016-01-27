require "rails_helper"

RSpec.describe "API Versioning", type: :request do
  include_context "before suite"

  describe "GET /bucketlists" do
    context "when version is specified on url path" do
      it "returns items by the user with valid token provided" do
        token = api_token
        get "/api/v1/bucketlists", nil, HTTP_AUTHORIZATION: token

        expect(response).to have_http_status(200)
      end
    end

    context "when version specified in the 'Accept' header" do
      it "returns items by the user with valid token provided" do
        token = api_token
        get(
          "/api/bucketlists",
          nil,
          HTTP_AUTHORIZATION: token,
          Accept: "application/vnd.ebucketlist.herokuapp.com; version=1"
        )

        expect(response).to have_http_status(200)
      end
    end

    context "when version is passed as a parameter in the url" do
      it "returns items by the user with valid token provided" do
        token = api_token
        get "/api/bucketlists?version=v1", nil, HTTP_AUTHORIZATION: token

        expect(response).to have_http_status(200)
      end
    end
  end
end
