Rails.application.routes.draw {
  get '/users', to: 'users#users'

  get '/users/:id', to: 'users#user_id'

  post '/users', to: 'users#create'

  put '/users/:id', to: 'users#update'

  delete 'users/:id', to: 'users#delete'

  post '/posts', to: 'posts#create'

  put '/posts/:id', to: 'posts#update'

  delete 'posts/:id', to: 'posts#delete'

  post '/comments', to: 'comments#create'

  delete 'comments/:id', to: 'comments#delete'

  root 'users#users'
}
