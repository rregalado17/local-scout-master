Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :tours, only: [:index, :show, :new, :create, :edit, :destroy]

patch 'tours/:id', to: 'tours#update'

end
