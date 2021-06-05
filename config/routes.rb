Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v2 do
      resource :users, only: :create
      get '/flowers', to: 'flowers#index'
      resource :flowers do
        resource :sightings, only: [:create, :index, :destroy]
      end

      resources :sightings do
        resources :likes, only: [:create, :destroy]
      end

      post '/login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'
    end
  end
end
