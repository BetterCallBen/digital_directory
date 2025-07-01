Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root "agencies#index"

  # Raccourci secret pour accéder à la connexion admin
  get "/admin", to: redirect("/users/sign_in")

  # Routes pour les agences (publiques)
  resources :agencies, only: [:index, :show]

  # Routes d'administration
  namespace :admin do
    root "base#index"
    resources :agencies
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
