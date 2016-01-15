module Api
  class BucketlistsController < ApplicationController
    def index
      @bucketlists = Bucketlist.all
      render json: @bucketlists
    end
  end
end
