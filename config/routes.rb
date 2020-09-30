Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :family_types, only: [:index] do
    resources :monsters, only: [:index, :show]
  end
end
