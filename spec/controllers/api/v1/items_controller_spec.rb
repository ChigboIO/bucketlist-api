# require "rails_helper"

# RSpec.describe Api::V1::ItemsController, type: :controller do
#   describe "GET #destroy" do
#     it "assigns and deletes @item and return http_status 200" do
#       bucketlist = create(:bucketlist)
#       item = create(:item, bucketlist: bucketlist)

#       get :destroy, id: item.id, bucketlist_id: bucketlist.id
#       expect(assigns(:item)).to eq(item)
#       expect(Item.find_by_id(item.id)).to be_nil
#       expect(Item.count).to eq(0)
#       expect(response).to have_http_status(:success)
#     end

#     it "return http_status 404 when ID does not exist" do
#       bucketlist = create(:bucketlist)

#       get :destroy, bucketlist_id: bucketlist.id, id: 20
#       expect(response).to have_http_status(404)
#     end
#   end

#   describe "GET #create" do
#     it "creates a new bucketlist item on valid params with status 201" do
#       bucketlist = create(:bucketlist)

#       post :create, bucketlist_id: bucketlist.id, name: "Play Ender's game"
#       expect(Item.count).to eq(1)
#       expect(response).to have_http_status(201)
#     end

#     it "creates no new bucketlist item on invalid params with status 400" do
#       bucketlist = create(:bucketlist)

#       post :create, bucketlist_id: bucketlist.id, name: ""
#       expect(Item.count).to eq(0)
#       expect(response).to have_http_status(400)
#     end
#   end

#   describe "GET #update" do
#     it "updates a bucketlist item on valid params with http_status 201" do
#       bucketlist = create(:bucketlist)
#       item = create(:item, bucketlist: bucketlist)

#       put :update, id: item.id, bucketlist_id: bucketlist.id, name: "New"
#       expect(assigns(:item)).to eq(item)
#       expect(Item.find_by_id(item.id).name).to eq("New")
#       expect(Item.count).to eq(1)
#       expect(response).to have_http_status(201)
#     end

#     it "does not updates a bucketlist item on invalid params, status 400" do
#       bucketlist = create(:bucketlist)
#       item = create(:item, bucketlist: bucketlist)

#       put :update, id: item.id, bucketlist_id: bucketlist.id, name: ""
#       expect(assigns(:item)).to eq(item)
#       expect(Item.find_by_id(item.id).name).to eq(item.name)
#       expect(Item.count).to eq(1)
#       expect(response).to have_http_status(400)
#     end

#     it "return http_status 404 when ID does not exist" do
#       put :update, id: 20, bucketlist_id: 10
#       expect(response).to have_http_status(404)
#     end
#   end
# end
