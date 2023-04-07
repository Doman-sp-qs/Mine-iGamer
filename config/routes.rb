Rails.application.routes.draw do
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
