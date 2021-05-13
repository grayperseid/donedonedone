Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "list_items#index"
  resources :list_items do
    member do
      patch 'completed'
    end
    collection do
      get 'recently_completed'
    end
  end
end
