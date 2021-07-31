Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    collection do  
      get "search", "category-search", "detail_search"
    end
    resources :buys, only: [:index, :create]
  end
end
