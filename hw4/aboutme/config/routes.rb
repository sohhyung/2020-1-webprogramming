Rails.application.routes.draw do
  root "profile#index"
  get '/profile', to: 'profile#index'

  get 'profile/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "profile/Activities"
  get "profile/Design"
end
