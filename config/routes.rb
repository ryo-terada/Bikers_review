Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  
  scope module: :user do
  root to: "homes#top"
  resources :bikes
  resources :users
  end
  
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
  end
end
