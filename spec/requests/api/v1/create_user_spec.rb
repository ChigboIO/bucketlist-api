require "rails_helper"

RSpec.describe "Create Bucketlist", type: :request do
  include_context "before suite"

  describe "POST /users/" do
    it "should not create when the name, email or password field is empty" do
      post("/api/v1/users/", name: "", email: "", password: "")

      expect(response).to have_http_status(400)
      expect(User.count).to eq(2)
    end

    it "should not create when email is invalid" do
      post(
        "/api/v1/users/",
        name: "Emmanuel Science",
        email: "invalid.email",
        password: "password"
      )

      expect(response).to have_http_status(400)
      expect(User.count).to eq(2)
    end

    it "create a new user record if the fields are filled correctly" do
      post(
        "/api/v1/users/",
        name: "Emmanuel Science",
        email: "valid.email@gmail.com",
        password: "password"
      )

      expect(response).to have_http_status(201)
      expect(User.count).to eq(3)
      expect(User.last.email).to eq("valid.email@gmail.com")
    end
  end
end
