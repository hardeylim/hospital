Rails.application.routes.draw do


  namespace :api, defaults: { format: 'json' } do

    # get 'hardey', to: "rav#index"
    # post 'rav', to: "rav#create"


    # get 'tasks', to "tasks#index"
    # get 'tasks/:id', to "tasks#show"
    # post 'tasks', to "tasks#create"
    # patch 'tasks/:id', to "tasks#update"
    # delete 'tasks/:id', to "tasks#destroy"

    # DO task_comments and task_participants
    # pdeng nested, pwedeng hindi

    # GET,POST,pATCH,DELETE tasks/:id/task_comments
    # GET,POST,pATCH,DELETE tasks/:id/task_participants
    
    # PATCH/DELETE/SHOW tasks/:task_id/task_comments/:id

    resources :tasks do
      member do
        resources :task_comments
        resources :task_participants
      end
    end

    
    # resources :task_participants
    # resources :task_comments

    

  end
  
end
