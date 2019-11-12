Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
    resources :vehicles, only: %i[index create update destroy show] do
      collection do
        get 'show_by_plate/:plate', action: :show_by_plate
      end

    end
    resources :entries, only: %i[index create update show destroy] do

    end
    resources :exits, only: %i[index create update show destroy] do
      collection do
        get 'show_details/:id', action: :show_details
        get 'show_statistics', action: :show_statistics
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





 end