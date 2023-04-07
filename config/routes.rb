Rails.application.routes.draw do
  namespace :public do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  get 'homes/top'
  get 'homes/about'
  
  # custoer側のルーティング(devise)
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  
  # admin側のルーティング(devise)
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  
  
end
