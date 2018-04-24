Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users do
    resources :questions
  end

  resources :questions do
    resources :answers
  end
end
