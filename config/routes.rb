Rails.application.routes.draw do
  
  ## Customer側
  # homesコントローラ
  root :to => "public/homes#top"
  get "about" => "public/homes#about", as: "about"
  
  # devise関連
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: "public" do
    resources :customers, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end
  
  
  
  ## Admin側
  # homesコントローラ
  get "/admin" => "admin/homes#top", as: "admin"
  
  # devise関連
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: "admin" do
    resources :customers, only: [:show, :edit, :update]
  end
  
end
