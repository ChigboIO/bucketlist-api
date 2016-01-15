module Api
  class BucketlistsController < ApplicationController
    def index
      @bucketlists = Bucketlist.all
      render json: @bucketlists
    end

    def create
      @bucketlist = Bucketlist.new(bucketlist_params)

      if @bucketlist.save
        render json: @bucketlist, status: 201 # created
      else
        render json: @bucketlist.errors.full_messages, status: 400
      end
    end

    def show
      @bucketlist = Bucketlist.find(params[:id])
      render json: @bucketlist
    rescue
      render json: { error: "No result found for this request" }, status: 404
    end

    def destroy
      @bucketlist = Bucketlist.find(params[:id])
      @bucketlist.destroy
      render json: { message: "Bucketlist deleted successfully" }, status: 200
    rescue
      render json: { error: "No such bucketlist was found" }, status: 404
    end

    private

    def bucketlist_params
      params.permit(:name)
    end
  end
end
