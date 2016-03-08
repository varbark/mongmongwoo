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
    end
  end
end