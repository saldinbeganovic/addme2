Rails.application.routes.draw do
  resources :messages
  resources :chats
  devise_for :accounts, controllers: {omniauth_callbacks: 'omniauth'}
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#dashboard
get"/dashboard"=>"accounts#index"
get"profile/:username"=>"accounts#profile", as: :profile
get"post/like/:post_id"=>"likes#save_like", as: :like_post
post "follow/account"=>"accounts#follow_account", as: :follow_account
post "/chats/:id" =>"messages#create"
mount Commontator::Engine => '/commontator'
mount ActionCable.server => '/cable'

resources :posts, only: [:new,:create,:show]
resources :comments, only: [:create, :destroy]
resources :messages, only: [:create, :destroy]


 root to: "public#homepage"

end
