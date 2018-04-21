Rails.application.routes.draw do
  get 'users/show'
  get 'users'
  devise_for :users
  get '/' => 'books#top'
  get '/about' => 'books#about'
  resources :books


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
