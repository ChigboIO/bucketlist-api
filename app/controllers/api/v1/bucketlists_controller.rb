module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :user_bucketlists

      def user_bucketlists
        @bucketlists = User.find(current_user).bucketlists
      end

      def index
        render json: @bucketlists.search(params[:q]).paginate(params)
      end

      def show
        @bucketlist = @bucketlists.find(params[:id])
        render json: @bucketlist
      rescue
        render json: { error: "No result found for this request" }, status: 404
      end

      def create
        @bucketlist = @bucketlists.new(bucketlist_params)
        @bucketlist.user_id = current_user

        if @bucketlist.save
          render json: @bucketlist, status: 201 # :created
        else
          render json: @bucketlist.errors.full_messages, status: 400
        end
      end

      def update
        @bucketlist = find_bucketlist(params[:id])
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist, status: 201
        else
          render json: @bucketlist.errors.full_messages, status: 400
        end
      rescue
        render json: { error: "No such bucketlist was found" }, status: 404
      end

      def destroy
        @bucketlist = find_bucketlist(params[:id])
        @bucketlist.destroy
        render json: { message: "Bucketlist deleted successfully" }, status: 200
      rescue
        render json: { error: "Bucketlist not found" }, status: 404
      end

      private

      def find_bucketlist(id)
        @bucketlist = @bucketlists.find(id)
      end

      def bucketlist_params
        params.permit(:name)
      end
    end
  end
end
