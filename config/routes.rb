Rails.application.routes.draw {
  get '/users', to: 'users#users'

  get '/users/:id', to: 'users#user_id'

  post '/users', to: 'users#create'

  put '/users/:id', to: 'users#update'

  delete 'users/:id', to: 'users#destroy'

  post '/posts', to: 'posts#create'

  put '/posts/:id', to: 'posts#update'

  delete 'posts/:id', to: 'posts#destroy'

  post '/comments', to: 'comments#create'

  delete 'comments/:id', to: 'comments#destroy'

  root 'users#users'
}
