Rails.application.routes.draw do
  devise_for :users
  
  root "splash#index"

  resources :categories, only: %i[index new] do
    resources :transactions, only: %i[index new]
  end
end
