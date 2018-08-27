Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/search', to: "pages#search", as: :search
  resources :apartments do
    resources :bookings, except: [:edit, :update] do
      resources :reviews
    end
  end
end
