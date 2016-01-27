require "rails_helper"

RSpec.describe "Other Routs", type: :request do
  include_context "before suite"

  describe "GET /" do
    it "redirects to the apiary documentation page" do
      get "/"

      expect(response).to have_http_status(302)
      expect(response).to redirect_to "http://docs.ebucketlist.apiary.io/#"
    end
  end

  describe "GET /invalid/path" do
    it "return 'page not found error' on wrong url path" do
      get "/api/v1/invalid/path"
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(404)
      expect(json_response).to include("error")
    end
  end
end
