module Api
  class BucketlistsController < ApplicationController
    def index
      @bucketlists = Bucketlist.all
      render json: @bucketlists
    end

    def show
      @bucketlist = Bucketlist.find(params[:id])
      render json: @bucketlist
    rescue
      render json: { error: "No result found for this request" }, status: 404
    end
  end
end
