# require "rails_helper"

# RSpec.describe Api::V1::BucketlistsController, type: :controller do
#   describe "GET index" do
#     it "assigns @bucketlists and return http_status 200" do
#       user = create(:user)
#       bucketlists = create(:bucketlist, user: user)

#       get :index
#       expect(assigns(:bucketlists)).to eq([bucketlists])
#       expect(response).to have_http_status(200)
#       # expect(JSON.parse(response.body)).to be_valid
#     end
#   end

#   describe "GET show" do
#     it "assigns @bucketlist and return http_status 200" do
#       user = create(:user)
#       bucketlist = create(:bucketlist, user: user)

#       get :show, id: bucketlist.id
#       expect(assigns(:bucketlist)).to eq(bucketlist)
#       expect(response).to have_http_status(200)
#     end

#     it "and return http_status 404" do
#       get :show, id: 20
#       expect(response).to have_http_status(404)
#     end
#   end

#   describe "DELETE destroy" do
#     it "assigns and deletes @bucketlist and return http_status 200" do
#       user = create(:user)
#       bucketlist = create(:bucketlist, user: user)

#       get :destroy, id: bucketlist.id
#       expect(assigns(:bucketlist)).to eq(bucketlist)
#       expect(Bucketlist.find_by_id(bucketlist.id)).to be_nil
#       expect(Bucketlist.count).to eq(0)
#       expect(response).to have_http_status(200)
#     end

#     it "return http_status 404 when ID does not exist" do
#       get :destroy, id: 20
#       expect(response).to have_http_status(404)
#     end
#   end

#   describe "POST create" do
#     it "creates a new bucketlist instance on valid params with status 201" do
#       post :create, name: "Endless"
#       expect(Bucketlist.count).to eq(1)
#       expect(response).to have_http_status(201)
#     end

#     it "creates a new bucketlist instance on invalid params status: 400" do
#       post :create, name: ""
#       expect(Bucketlist.count).to eq(0)
#       expect(response).to have_http_status(400)
#     end
#   end

#   describe "PUT update" do
#     it "updates a bucketlist instance on valid params with http_status 201" do
#       bucketlist = create(:bucketlist)
#       put :update, id: bucketlist.id, name: "New"
#       expect(assigns(:bucketlist)).to eq(bucketlist)
#       expect(Bucketlist.find_by_id(bucketlist.id).name).to eq("New")
#       expect(Bucketlist.count).to eq(1)
#       expect(response).to have_http_status(201)
#     end

#     it "doesn't update a bucketlist instance on invalid params, status 400" do
#       bucketlist = create(:bucketlist)
#       put :update, id: bucketlist.id, name: ""
#       expect(assigns(:bucketlist)).to eq(bucketlist)
#       expect(Bucketlist.find_by_id(bucketlist.id).name).to eq(bucketlist.name)
#       expect(Bucketlist.count).to eq(1)
#       expect(response).to have_http_status(400)
#     end

#     it "return http_status 404 when ID does not exist" do
#       put :update, id: 20
#       expect(response).to have_http_status(404)
#     end
#   end
# end
