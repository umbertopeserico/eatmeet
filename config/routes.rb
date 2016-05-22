Rails.application.routes.draw do
  devise_for :users
  devise_for :restaurant_owners

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :categories, only: [ :index, :show ] do
        get '/events' => 'categories#events', on: :member
      end

      resources :events, only: [ :index, :show ] do
        get 'participants' => 'events#participants', on: :member
      end

      resources :users, only: [:show]
    end
  end

end
