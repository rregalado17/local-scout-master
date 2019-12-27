Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :users, only: [:index, :show, :new, :create, :edit, :destroy]
resources :destinations, only: [:index, :show, :new, :create, :edit, :destroy]
resources :tours, only: [:index, :show, :new, :create, :edit, :destroy]


patch 'destinations/:id', to: 'destinations#update'
patch 'tours/:id', to: 'tours#update'

end
