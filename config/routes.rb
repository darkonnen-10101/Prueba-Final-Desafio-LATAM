Rails.application.routes.draw do

  get 'tags/create'
  get 'tags/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    # omniauth_callbacks: 'users/omniauth_callbacks'
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :categories

  resources :projects do
    member do
      post 'add_tag'
      get 'all', to: 'projects#all', as: 'all'
      delete 'remove_tag/:tag_id', to: 'projects#remove_tag', as: 'remove_tag'
    end
    # resources :tags
    resources :comments, only: [:create, :destroy]
  end

  get 'users', to: 'users#all'
  get 'profile/:id', to: 'users#profile', as: 'profile'
  get 'display', to: 'projects#display'
  get 'about', to: 'informations#about'

  root to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
