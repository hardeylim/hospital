# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    # lagyan ng delete
    resources :head_nurses, only: %i[index create delete]

    # POST nurses/:id/assign
    # POST nurses/:id/promote
    # POST nurses/assign
    resources :nurses do
      member do
        post :assign
      end
    end

    # GET chat_rooms
    # GET chat_rooms/:id
    # POST chat_rooms
    # DELTE chat_rooms/:id
    # PATCH chat_rooms/:id

    # POST chat_rooms/:id/messages
    # DELETE chat_rooms/:id/messages/:id


    resources :sessions
    
    resources :chat_rooms do
      member do
        resources :messages, only: %i[create delete]
      end
    end
    # nurses/:id/head_nurses/:id/assign
    # resources :nurses do
    #   resources :head_nurses do
    #     member do
    #       post :assign
    #     end
    #   end
    # end

    resources :patients
  end
end
