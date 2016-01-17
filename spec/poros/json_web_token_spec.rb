require "rails_helper"

RSpec.describe JsonWebToken do
  subject do
    JsonWebToken.encode(user_id: 203)
  end
  describe ".encode" do
    it "encodes a payload and return a string token" do
      expect(subject).to be_a(String)
      expect(subject).to include(".")
    end
  end

  describe ".decode" do
    it "decodes a token and return the encoded payload" do
      payload = JsonWebToken.decode(subject)
      expect(payload).to be_a(Hash)
      expect(payload).to include("user_id")
    end
  end
end
