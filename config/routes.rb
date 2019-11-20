Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :categories

  resources :projects do
    member do
      # post 'add_category'
      get 'all', to: 'projects#all', as: 'all'
      # delete 'remove_category/:category_id', to: 'projects#remove_category', as: 'remove_category'
    end
    resources :categories

    resources :comments, only: [:create, :destroy]
  end

  get 'users', to: 'users#all'
  get 'profile/:id', to: 'users#profile', as: 'profile'
  get 'display', to: 'projects#display'

  root to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
