Rails.application.routes.draw do

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' },
             skip: [:sessions, :registrations]

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :matelists do
    resources :invites
  end
  root "home#index"
end
