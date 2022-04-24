Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  post 'books' => 'books#create' 
  
  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  resources :books, only: [:new, :create]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
