require "rails_helper"

RSpec.describe Api::BucketlistsController, type: :controller do
  describe "GET index" do
    it "assigns @bucketlist" do
      bucketlists = create(:bucketlist)
      get :index
      expect(assigns(:bucketlists)).to eq([bucketlists])
    end
  end
end
