module Api
  module V1
    class BucketlistsController < ApplicationController
      def index
        bucketlists = current_user_bucket.search(params[:q]).paginate(params)
        render json: bucketlists, status: 200
      end

      def show
        bucketlist = find_bucketlist(params[:id])
        render json: bucketlist, status: 200
      rescue
        render json: { error: "No result found for this request" }, status: 404
      end

      def create
        parameters = bucketlist_params.merge(user_id: current_user_id)
        bucketlist = Bucketlist.new(parameters)

        if bucketlist.save
          render json: bucketlist, status: 201
        else
          render json: bucketlist.errors.full_messages, status: 400
        end
      end

      def update
        bucketlist = find_bucketlist(params[:id])
        if bucketlist.update(bucketlist_params)
          render json: bucketlist, status: 201
        else
          render json: bucketlist.errors.full_messages, status: 400
        end
      rescue
        render json: { error: "No such bucketlist was found" }, status: 404
      end

      def destroy
        bucketlist = find_bucketlist(params[:id])
        bucketlist.destroy
        render json: { message: "Bucketlist deleted successfully" }, status: 200
      rescue
        render json: { error: "Bucketlist not found" }, status: 404
      end

      private

      def find_bucketlist(id)
        current_user_bucket.find(id)
      end

      def current_user_bucket
        Bucketlist.by_current_user(current_user_id)
      end

      def bucketlist_params
        params.permit(:name)
      end
    end
  end
end
