Rails.application.routes.draw do
  
  #トップページ用
  root to: "toppages#index"
  
  
  #ユーザー情報用
  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]
  #newあるのに何で二個作るん？
  #見た目sighupの方がurl的にかっこいいやろ
  #users#newでもusers#signupでもどっちでも同じもん開く
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
end
