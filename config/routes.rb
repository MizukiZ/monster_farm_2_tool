Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'landing_page#index'

  resources :family_types, only: [:index]
  resources :monsters, only: [:index, :show] do
    resources :best_matches, only: [:index]
  end

  resources :monster_search, only: [:index]
end
