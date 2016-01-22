require "rails_helper"

RSpec.describe "Create Bucketlist", type: :request do
  include_context "before suite"

  describe "POST /bucketlists/" do
    it "fails with an invalid token" do
      test_with_invalid_token(:post, "/api/v1/bucketlists/")
    end

    it "should not create when the name field is empty" do
      token = api_token
      post(
        "/api/v1/bucketlists/",
        { name: "" },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(400)
      expect(Bucketlist.count).to eq(6)
    end

    it "creates and returns the new record when valid token is provided" do
      token = api_token
      post(
        "/api/v1/bucketlists/",
        { name: "After Andela", user_id: user.id },
        HTTP_AUTHORIZATION: token
      )

      expect(response).to have_http_status(201)
      expect(Bucketlist.count).to eq(7)
      expect(Bucketlist.last.user.name).to eq(user.name)
    end
  end
end
