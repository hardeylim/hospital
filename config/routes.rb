Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do


    # lagyan ng delete
    resources :head_nurses

    # POST nurses/:id/assign
    # POST nurses/:id/promote
    # POST nurses/assign
    resources :nurses do
      member do
        post :assign
      end
      collection do
        post :assign
      end
    end

    resources :patients
  end
end
