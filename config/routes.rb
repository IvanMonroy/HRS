Rails.application.routes.draw do
  namespace :api do
    get 'exit/all'
  end
  namespace :api do
    get 'vehicle_controller/all'
  end
  namespace :api do
    get 'entry_controller/all'
  end
  namespace :api do
    get 'rate/all'
    resources :rates, only: %i[index create update show destroy] do
    end
    resources :vehicles, only: %i[index create update show destroy] do

    end
    resources :entries, only: %i[index create update show destroy] do

    end
    resources :exits, only: %i[index create update show destroy] do

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





 end