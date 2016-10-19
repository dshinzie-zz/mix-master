Rails.application.routes.draw do
 
  resources :artists do
    resources :songs, except: [:show, :edit, :update, :destroy]
  end
  
  resources :songs, except: [:create, :new]
end 
