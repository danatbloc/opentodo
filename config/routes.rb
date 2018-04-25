Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:index, :create, :update, :destroy]
    end

  end

end
