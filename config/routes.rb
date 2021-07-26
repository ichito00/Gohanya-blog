Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: 'customers/registrations',
  sessions: 'customers/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'

    resources :customers, only: [:index, :show, :edit, :update]
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'

    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    get 'contact' => 'contact#new'
    post 'contact/confirm' => 'contact#confirm'
    post 'contact/complete' => 'contact#complete'
  end

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
end
