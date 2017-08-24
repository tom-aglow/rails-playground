Rails.application.routes.draw do

  # root route
  root 'demo#index'

  # simple route
  # get 'demo/index'

  # resourceful routes

  resources :subjects do
    member do
      get :delete
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

  # default route
  get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
