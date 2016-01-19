module Support
  module RequestHelpers
    shared_context "before suite" do
      let(:user) { User.order("RANDOM()").first }
      let(:bucketlists) { user.bucketlists }
      let(:bucketlist) { bucketlists.order("RANDOM()").first }
      let(:items) { bucketlist.items }
      let(:item) { items.order("RANDOM()").first }

      def api_login(email = user.email, password = "science")
        post "/api/v1/auth/login", email: email, password: password
      end

      def api_token
        api_login
        json_response = JSON.parse(response.body)

        json_response["token"]
      end

      def test_with_invalid_token(verb, path)
        method(verb).call(path, nil, HTTP_AUTHORIZATION: "invalid.token")

        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(401)
        expect(json_response).to include("error")
      end

      def test_with_invalid_bucketlist(verb, path)
        token = api_token
        method(verb).call(path, nil, HTTP_AUTHORIZATION: token)

        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(404)
        expect(json_response).to include("error")
      end
    end
  end
end
