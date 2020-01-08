Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root "application#index"

resources :users
resources :trips
resources :destinations, only: [:index, :show]
resources :tours do 
  resources :comments
end


patch 'tours/:id', to: 'tours#update'

get '/signin' => "sessions#new"
post '/signin' => "sessions#create"
delete '/signout' => "sessions#destroy"
get '/signup' => "users#new"
post '/signup' => "users#create"
get 'trips/create'
post '/trip' => "trips#create"
get '/auth/facebook/callback' => 'sessions#create'

end
