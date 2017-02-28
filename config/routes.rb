Rails.application.routes.draw do

  root to: 'videos#index'

  resources :videos, only: 'index'

  get 'about', to: 'pages#about'

end
