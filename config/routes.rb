Rails.application.routes.draw do
  get '/' => 'books#top'
  get '/about' => 'books#about'
  resources :books


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
