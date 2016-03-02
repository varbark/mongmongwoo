Rails.application.routes.draw do
  namespace :admin do
    root "items#index"
    resources :items
  end
end