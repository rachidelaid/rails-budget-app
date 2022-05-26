Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: %i[index new create] do
    resources :transactions, only: %i[index new create]
  end

  unauthenticated do
    root "splash#index"
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
