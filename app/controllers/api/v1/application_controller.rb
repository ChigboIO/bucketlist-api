module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::Serialization

      before_action :authenticate_user_from_token, except: [:no_route, :root]

      def default_serializer_options
        { root: false }
      end

      def no_route
        render(
          json: { error: "Path not found", path: params[:path] },
          status: 404
        )
      end

      def root
        redirect_to "http://docs.ebucketlist.apiary.io/#"
      end

      attr_reader :current_user_id

      def authenticate_user_from_token
        token = get_token
        payload = JsonWebToken.decode(token)
        if payload
          @current_user_id = payload["user_id"]
        else
          render json: { error: "Unauthorized access" }, status: 401
        end
      end

      def get_token
        auth_header = request.headers["Authorization"]
        if auth_header
          token = auth_header.split(" ").last
          return token if Token.find_by_value(token)
        end
      end
    end
  end
end
