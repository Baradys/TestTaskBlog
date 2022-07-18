Rails.application.routes.draw {
  Rails.application.routes.draw do
    resources :users
    resources :posts, only: %i[create update destroy]
    resources :comments, only: %i[create destroy]
  end

  root 'users#index'
}
