require "rails_helper"

RSpec.describe "User Logout", type: :request do
  include_context "before suite"

  describe "GET /auth/logout" do
    it "fails with an invalid token" do
      test_with_invalid_token(:get, "/api/v1/auth/logout")
    end

    it "logs out with valid token provided" do
      token = api_token
      get "/api/v1/auth/logout", nil, HTTP_AUTHORIZATION: token
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response).to include("notice")
      expect(json_response).to_not include("error")
      expect(Token.find_by_value(token)).to be_nil
    end
  end
end
