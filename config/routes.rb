Rails.application.routes.draw do
  get 'music/discover', as: :discover

  get 'search', to: 'music#search'

  get 'music/list'

  get 'visitors/index'

  devise_for :users, skip: :registrations, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
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

  resources :users, constraints: {id: /([^\/]+?)(?=\.json|\.html|$|\/)/}, except: [:new, :create]
  resources :playlists
  # Also wee ned to be able to add a song to a playlist
  get 'playlists/:id/addSong/:song_id', to: 'playlists#add_song'
  get 'artists/:id', to:'artists#show'
  get 'albums/:id', to: 'albums#show'
  # Admin routes
  scope 'admin' do
    resources :albums
    resources :songs
    resources :artists
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
