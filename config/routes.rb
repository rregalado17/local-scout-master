Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root "application#index"

resources :users
resources :destinations, only: [:index, :show, :new, :create, :edit, :destroy]
resources :tours, only: [:index, :show, :new, :create, :edit, :destroy]


patch 'destinations/:id', to: 'destinations#update'
patch 'tours/:id', to: 'tours#update'

get '/signin' => "sessions#new"
post '/signin' => "sessions#create"
delete '/signout' => "sessions#destroy"
get '/signup' => "users#new"
post '/signup' => "users#create"


end
