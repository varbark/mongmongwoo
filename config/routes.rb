Rails.application.routes.draw do
  namespace :admin do
    root "items#index"
    resources :items
    resources :categories, only: [:new, :create, :show, :index]
  end
end