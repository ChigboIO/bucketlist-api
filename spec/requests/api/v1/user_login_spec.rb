require "rails_helper"

RSpec.describe "User Login", type: :request do
  include_context "before suite"

  describe "POST /auth/login" do
    it "fails with an invalid email and password" do
      api_login("invalid@mail.com", "invalid-password")
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(400)
      expect(json_response).to include("error")
      expect(json_response).to_not include("token")
    end

    it "logs in with valid email and password and return a token" do
      api_login
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(201)
      expect(json_response).to include("token")
      expect(json_response).to include("notice")
      expect(json_response).to_not include("error")
      expect(Token.last.value).to eq(api_token)
    end
  end
end
