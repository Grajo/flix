Rails.application.routes.draw do

  root "movies#index"

  # get "movies" => "movies#index"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"
 
  #this creates all necessary routes for the Movies controller 
  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  # Note that the session is a single resource, so it should be singular as per best Ruby practices
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"
  
end
