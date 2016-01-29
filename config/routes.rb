Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :expenses

      resources :users do
        resources :expenses, only: [:index]
      end

      resources :categories do
        resources :expenses, only: [:index]
      end

    end
  end
end
