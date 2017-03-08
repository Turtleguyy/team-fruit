Rails.application.routes.draw do

  root to: 'videos#index'

  resources :videos, only: 'index'

  get 'about', to: 'pages#about'
  post 'share_cookies', to: 'videos#share_cookies'
  post 'vote', to: 'votes#create'

end
