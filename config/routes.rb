Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :update, :destroy]
    resources :lists, only: [:index, :create, :update, :destroy]

    resources :lists, only: [] do
      resources :items, only: [:index, :create, :update, :destroy]
    end
  end
end
