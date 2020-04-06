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

    # GET,POST,PATCH,DELETE tasks/:id/task_comments
    # GET,POST,PATCH,DELETE tasks/:id/task_participants
    
    # PATCH/DELETE/SHOW tasks/:task_id/task_comments/:id

    # api/tasks/inactive

    resources :tasks do
      resources :task_comments
      resources :task_participants
      member do
        # get,post,patch,delete
      end

      # get,post,patch,delete
      collection do
        # get,post,patch,delete
        # kpag resource = different controller
        get :archived
        get :in_progress
      end
    end

    
    # resources :task_participants
    # resources :task_comments

    

  end
  
end
