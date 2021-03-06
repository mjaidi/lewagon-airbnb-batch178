Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :apartments do
    resources :bookings, except: [:edit, :update] do
      resources :appt_reviews
    end
  end
  get 'users/:user_id/host', to: 'pages#host', as: :host_user
  get 'users/:user_id/messages', to: 'pages#messages', as: :messages_user
  get 'users/:user_id/trips', to: 'pages#trips', as: :booking_trips
  # patch 'apartments/:id/upload', to: 'apartments#upload', as: :apartments_img_upload
end
