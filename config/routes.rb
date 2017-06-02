Rails.application.routes.draw do
  get 'music/discover', as: :discover

  get 'search', to: 'music#search'

  get 'music/list'

  get 'visitors/index'

  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             controller: 'devise/registrations',
             as: :user_registration do
              get :cancel
            end
  end
  authenticated :user do
    root 'music#discover', as: :authenticated_root
  end

  root 'visitors#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
