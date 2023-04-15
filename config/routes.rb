Rails.application.routes.draw do
  
  namespace :admin do
    get 'posts/show'
    get 'posts/edit'
  end
  ### Customer側
  ## homesコントローラ
  root :to => "public/homes#top"
  get "about" => "public/homes#about", as: "about"
  
  ## devise関連
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  ## "public"scope
  scope module: "public" do
    ## customerユーザ関連
    resources :customers, only: [:show, :edit, :update] do
      # フォローフォロワー機能
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    ## 投稿関連
    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      # コメント機能
      resources :post_comments, only: [:create, :destroy]
      # いいね機能
      resource :favorites, only: [:create, :destroy]
    end
    # いいね一覧
    get "posts/:customer_id/favorites" => "favorites#index", as: "favorites"
  end
  
  
  
  ### Admin側
  ## homesコントローラ
  # customer一覧ページ
  get "/admin" => "admin/homes#customers", as: "admin_customers"
  # post一覧ページ
  get "/admin/posts" => "admin/homes#posts", as: "admin_posts"
  
  ## devise関連
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  ## adminユーザ関連
  # "admin"
  namespace :admin do
    # customer管理
    resources :customers, only: [:show, :edit, :update] do
      post "is_stop", on: :member
    end
    resources :posts, only: [:show, :edit, :update, :destroy]
  end
  
  
end
