require "rails_helper"

RSpec.describe Api::V1::ApplicationController do
  describe "#get_user" do
    application = Api::V1::ApplicationController.new
    it { expect(application.get_user("invalid.token")).to be_nil }
  end
end
