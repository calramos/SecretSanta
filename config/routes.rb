Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  get 'welcome/form'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  post 'users/:id', to: 'users#update'
  get '/users/:id', to: 'users#update'

  resources :users, only: [:update]
  resources :sessions, only: [:create, :destroy]
  resource :welcome, only: [:index]

  # You can have the root of your site routed with "root"
   root to: 'welcome#index'

  # Example of regular route:
     get '/:form' => 'welcome#form'
end
