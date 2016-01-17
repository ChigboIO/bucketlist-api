module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::Serialization

      before_action :authenticate_user_from_token, except: :no_route

      def default_serializer_options
        { root: false }
      end

      def no_route
        render(
          json: {
            error: "No such route exists in this application",
            path: params[:path]
          },
          status: 404
        )
      end

      protected

      attr_reader :current_user

      def authenticate_user_from_token
        token = get_token
        if token && user_id = get_user(token)
          @current_user = user_id
        else
          render json: { error: "Unauthorized access" }, status: 401
        end
      end

      def get_token
        if auth_header = request.headers["Authorization"]
          token = auth_header.split(" ").last
          return token if Token.find_by_value(token)
        end

        nil
      end

      def get_user(token)
        # byebug
        JsonWebToken.decode(token)["user_id"]
      rescue # NoMethodError => e
        nil
      end
    end
  end
end
