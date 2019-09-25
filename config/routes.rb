Rails.application.routes.draw do
  get 'posts/create'
  get 'posts/delete'
  post 'posts/destroy', only: [:destroy]
  post 'posts/store', only: [:store]
  get 'posts/index',only: [:userpost]
  get '/posts/:id', to: 'posts#show'
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
