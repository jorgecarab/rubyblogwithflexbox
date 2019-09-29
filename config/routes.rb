Rails.application.routes.draw do
  get 'posts/create'
  get 'posts/delete'
  get 'posts/index',only: [:userpost]
  get '/posts/:id', to: 'posts#show'
  get '/posts/edit/:id', to: 'posts#edit'
  post 'posts/destroy', only: [:destroy]
  post '/posts/store', action: :store, controller: 'posts'
  post '/posts/update/:id', action: :update, controller: 'posts'

  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
