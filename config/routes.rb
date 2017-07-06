Rails.application.routes.draw do
  devise_for :users
  #resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :v1 do
  	resources :sessions, only: [:create, :destroy]
  	resources :test
  	resources :projects
  end 
end
