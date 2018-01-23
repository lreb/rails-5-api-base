Rails.application.routes.draw do
  
  
  
  #devise_for :users, :controllers => {:user => "v1/users"}
  
  #resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :v1 do
  	resources :logins,only: [:create]
    resources :users, only: [:create]
  	resources :sessions, only: [:create, :destroy]
  end 
end
