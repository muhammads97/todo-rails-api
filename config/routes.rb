Rails.application.routes.draw do
  resource :users, only:[:create]
  post '/login', to: "users#login"
  get '/auto_login', to:"users#auto_login"

  resources :lists, only: [:index, :create, :show, :destroy] do
    resources :todos
  end
end


# Prefix              Verb      URI Pattern                         Controller#Action
# users               POST      /users(.:format)                    users#create
# login               POST      /login(.:format)                    users#login
# auto_login          GET       /auto_login(.:format)               users#auto_login
# list_todo_index     GET       /lists/:list_id/todo(.:format)      todo#index
#                     POST      /lists/:list_id/todo(.:format)      todo#create
# list_todo           GET       /lists/:list_id/todo/:id(.:format)  todo#show
#                     PATCH     /lists/:list_id/todo/:id(.:format)  todo#update
#                     PUT       /lists/:list_id/todo/:id(.:format)  todo#update
#                     DELETE    /lists/:list_id/todo/:id(.:format)  todo#destroy
# lists               GET       /lists(.:format)                    lists#index
#                     POST      /lists(.:format)                    lists#create
# list                GET       /lists/:id(.:format)                lists#show
#                     DELETE    /lists/:id(.:format)                lists#destroy