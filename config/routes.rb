Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    api_version(
      module: "V1",
      header: {
        name: "Accept",
        value: "application/vnd.ebucketlist.herokuapp.com; version=1"
      },
      path: { value: "v1" },
      parameter: { name: "version", value: "v1" },
      default: true
    ) do
      resources :bucketlists, except: [:new, :edit] do
        resources :items, only: [:create, :update, :destroy]
      end

      resources :users, only: :create

      scope :auth do
        post "login", to: "auth#login"
        get "logout", to: "auth#logout"
      end
    end
  end

  match "*path", to: "api/v1/application#no_route", via: :all
end
