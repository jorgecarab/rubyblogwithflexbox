Rails.application.routes.draw do
  get 'post/create'
  post 'post/store', only: [:store]
  get 'home/index',only: [:userpost]
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
