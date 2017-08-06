Rails.application.routes.draw do
  
  #トップページ用
  root to: "toppages#index"
  
  
  #ユーザー情報登録確認用
  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]
  #newあるのに何で二個作るん？
  #見た目sighupの方がurl的にかっこいいやろ
  #users#newでもusers#signupでもどっちでも同じもん開く
  
  #ログイン用
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #アイテム検索表示用
  resources :items, only: [:show, :new]
  #ここでは、楽天 API を使った検索結果を表示するページ(new)のみを作成します。
  #検索したものを全て保存する必要はなく、共有したいものだけを保存するので、次の Want, Have 機能の実装のときに、 Item を保存します#
  
  #Want/Have機能用
  resources :ownerships, only: [:create, :destroy]
  
  #ランキング用
  get 'rankings/want', to: 'rankings#want'
  get "rankings/have", to: "rankings#have"
end
