Rails.application.routes.draw do
  
  # get 'static_pages/about'
  root 'application#index'
  get '/about' => "static_pages#about"

  get '/projects' => "projects#index"


  resources :posts
end
