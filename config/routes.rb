Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => "users#root"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories
  end

end
