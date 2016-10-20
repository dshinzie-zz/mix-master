Rails.application.routes.draw do

  resources :artists do
    resources :songs, except: [:show, :edit, :update, :destroy]
  end

  resources :songs, except: [:create, :new]
  resources :playlists
  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
