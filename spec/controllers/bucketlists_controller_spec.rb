require "rails_helper"

RSpec.describe Api::BucketlistsController, type: :controller do
  describe "GET index" do
    it "assigns @bucketlists and return http_status 200" do
      bucketlists = create(:bucketlist)
      get :index
      expect(assigns(:bucketlists)).to eq([bucketlists])
      expect(response).to have_http_status(200)
      # expect(JSON.parse(response.body)).to be_valid
    end
  end

  describe "GET show" do
    it "assigns @bucketlist and return http_status 200" do
      bucketlist = create(:bucketlist)
      get :show, id: bucketlist.id
      expect(assigns(:bucketlist)).to eq(bucketlist)
      expect(response).to have_http_status(200)
    end

    it "and return http_status 404" do
      get :show, id: 20
      expect(response).to have_http_status(404)
    end
  end

  describe "DELETE destroy" do
    it "assigns and deletes @bucketlist and return http_status 200" do
      bucketlist = create(:bucketlist)
      get :destroy, id: bucketlist.id
      expect(assigns(:bucketlist)).to eq(bucketlist)
      expect(response).to have_http_status(200)
      expect(Bucketlist.find_by_id(bucketlist.id)).to be_nil
      expect(Bucketlist.count).to eq(0)
    end

    it "return http_status 404 when ID does not exist" do
      get :destroy, id: 20
      expect(response).to have_http_status(404)
    end
  end
end
