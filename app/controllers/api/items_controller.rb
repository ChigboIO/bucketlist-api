module Api
  class ItemsController < ApplicationController
    def create
      @item = Item.new(item_params)
      @item.bucketlist_id = params[:bucketlist_id]

      if @item.save
        render json: @item, status: 201 # created
      else
        render json: @item.errors.full_messages, status: 400
      end
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        render json: @item, status: 201
      else
        render json: @item.errors.full_messages, status: 400
      end
    rescue
      render json: { error: "No such item was found" }, status: 404
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      render json: { message: "Item deleted successfully" }, status: 200
    rescue
      render json: { error: "No such item was found" }, status: 404
    end

    private

    def item_params
      params.permit(:name, :done)
    end
  end
end
