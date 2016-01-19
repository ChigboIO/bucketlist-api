require "rails_helper"

RSpec.describe "Invalid Path", type: :request do
  include_context "before suite"

  describe "GET /invalid/path" do
    it "return 'page not found error' on wrong url path" do
      get "/api/v1/invalid/path"
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(404)
      expect(json_response).to include("error")
    end
  end
end
