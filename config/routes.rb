Rails.application.routes.draw do

  

  get 'micropost/new'

  get 'micropost/show'

  get 'micropost/edit'

  root :to => 'static_pages#home'
  get 'static_pages/home'

  get 'static_pages/help'
  
  get 'static_pages/about'

  resources :users do
  member do
   get :following, :followers
  end
end
  resources :sessions, only: [:new, :create, :destroy]
  resources :micropost
  resources :relationships, only: [:create, :destroy]
 
  match '/signup', to: 'users#new', via: :get
  match '/signin', to: 'sessions#new',via: :get  
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/sessions', to: 'sessions#create', via: :post
  match '/micropost/new', to: 'micropost#create', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
