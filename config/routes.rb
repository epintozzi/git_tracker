Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'commits#index'

  namespace :api do
    namespace :v1 do
      resources :commits, only: [:create]
    end
  end

end
