require "rails_helper"

RSpec.describe "User Login", type: :request do
  include_context "before suite"

  describe "GET /auth/login" do
    it "fails with an invalid email and password" do
      api_login("invalid@mail.com", "invalid-password")
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(400)
      expect(json_response).to include("error")
      expect(json_response).to_not include("token")
    end
  end
end
