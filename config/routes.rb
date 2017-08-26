Rails.application.routes.draw do
  # root route
  root to: 'public#index'

  get 'show/:permalink', to: 'public#show', as: 'public_show'

  # admin routes
  get 'admin', to: 'access#menu'

  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  # simple route
  # get 'demo/index'

  # resourceful routes

  resources :subjects do
    member do
      get :delete
      patch :publish
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :admin_users, excepts: [:show] do
    member do
      get :delete
    end
  end

  # default route
  get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
