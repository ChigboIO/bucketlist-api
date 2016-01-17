module Request
  module Helpers
    shared_context "before suite" do
      let(:user) { User.order("RANDOM()").first }
      let(:bucketlists) { user.bucketlists }
      let(:bucketlist) { bucketlists.order("RANDOM()").first }
      let(:items) { bucketlist.items }
      let(:item) { items.order("RANDOM()").first }

      # let(:valid_email) { "user1@seed.com" }
      # let(:test_email) { "test@seed.com" }
      # let(:invalid_test_email) { "test seed" }
      # let(:test_pass) { "testpass" }
      # let(:valid_pass) { "user1pass" }
      # let(:invalid_id) { "u" }
      let(:api_documentation_url) { "http://docs.apibucket.apiary.io/" }

      before(:all) do
        DatabaseCleaner.strategy = :truncation
      end

      def api_login(email = user.email, password = "science")
        post "api/v1/auth/login", { email: email, password: password }
      end

      def api_token
        api_signin
        json_response = JSON.parse(response.body)

        json_response["token"]
      end

      after(:all) do
        DatabaseCleaner.clean
      end
    end
  end
end