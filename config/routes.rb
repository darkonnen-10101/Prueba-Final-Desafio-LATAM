Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :categories

  resources :projects do
    member do
      post 'add_category'
      delete 'remove_category/:category_id', to: 'projects#remove_category', as: 'remove_category'
    end
    resources :comments, only: [:create, :destroy]
  end

  get 'display', to: 'projects#display'

  root to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
