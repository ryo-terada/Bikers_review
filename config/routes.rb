Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root to: "homes#top"
    resources :bikes, only: [:new, :create, :index, :show, :destroy] do
      resources :bike_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
    # 退会確認画面
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :bikes, only: [:show, :destroy]
    resources :users, only: [:index, :show, :update]
  end
end
