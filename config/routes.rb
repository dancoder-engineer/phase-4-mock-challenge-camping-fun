Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campers, only: [:index]
  resources :activities, only: [:index, :destroy]

  get '/campers/:id', to: 'campers#withacts'
end
