module Api
  module V1
    class ItemsController < ApplicationController
      before_action :confirm_bucketlist_ownership

      def confirm_bucketlist_ownership
        bucketlist = Bucketlist.where(
          user_id: current_user_id,
          id: params[:bucketlist_id]
        )

        if bucketlist.empty?
          render json: { error: "No such bucketlist was found" }, status: 404
        end
      end

      def create
        item = Item.new(item_params)

        if item.save
          render json: item, status: 201
        else
          render json: item.errors.full_messages, status: 400
        end
      end

      def update
        item = bucketlist_item(params[:id])

        if item.update(item_params)
          render json: item, status: 201
        else
          render json: item.errors.full_messages, status: 400
        end
      rescue
        render json: { error: "No such item was found" }, status: 404
      end

      def destroy
        item = bucketlist_item(params[:id])

        item.destroy
        render json: { message: "Item deleted successfully" }, status: 200
      rescue
        render json: { error: "No such item was found" }, status: 404
      end

      private

      def item_params
        params.permit(:bucketlist_id, :name, :done)
      end

      def bucketlist_item(id)
        Item.in_bucketlist(params[:bucketlist_id]).find(id)
      end
    end
  end
end
