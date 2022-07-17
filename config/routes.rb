Rails.application.routes.draw do
  get '/users', to: 'users#users'

  get '/users/:id', to: 'users#user_id'

  post '/users', to: 'users#create'

  put '/users/:id', to: 'users#update'

  delete 'users/:id', to: 'users#delete'



  root 'users#users'
end
