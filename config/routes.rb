Rails.application.routes.draw do
  root 'static_pages#home'

  mount_devise_token_auth_for 'User', at: 'api/users/auth'
  devise_for :restaurant_owners
  
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :categories, only: [ :index, :show ] do
        get '/events' => 'categories#events', on: :member
      end

      resources :events, only: [ :index, :show ] do
        get 'participants' => 'events#participants', on: :member
        get 'search' => 'events#search', on: :collection
      end

      resources :users, only: [:show]

      resources :restaurants, only: [ :index ]
    end
  end

  namespace :administrator do
    resources :categories
    resources :zones
    resources :restaurant_owners
    resources :restaurants
    resources :menus
    resources :events
    resources :users
  end

end
