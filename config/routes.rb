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

    get "users/show_uid/:uid", to: "users#show_uid", as: "uid_user"
  end
end