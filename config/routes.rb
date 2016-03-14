Rails.application.routes.draw do
  namespace :admin do
    root "items#index"
    resources :items
    resources :categories, only: [:new, :create, :show, :index]
    resources :users do
      collection do
        # 外界POST request
        post "import_user", to: "users#import_user"
      end

      # member do
      #   get "/:uid", to: "users#check_user"
      # end
    end
    resources :orders

    get "users/show_uid/:uid", to: "users#show_uid", as: "uid_user"    
  end

  namespace :cs_api, defaults: {format: 'json'} do
    # /county_id/town_id/store_id

    # APP: request  county_id

    # WEB: response towns.json

    # APP: request town_id

    # WEB: response stores.json

    # get  /counties/towns.json

    # get "/counties/:county_id/towns", to: "counties#towns_response"
    resources :counties, only: [:index, :show] do
      resources :towns, only: [:index, :show] do
        resources :roads, only: [:index, :show] do
          resources :stores, only: [:index, :show]
        end
      end
    end
  end

  namespace :order_api, defaults: { format: 'json' } do

  end
end