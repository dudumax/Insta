Rails.application.routes.draw do
  
  resources :feeds
  get 'comments/create'
  get 'sessions/new'
   resources :users, only: [:new, :create, :show]
    resources :sessions, only: [:new, :create, :destroy]
     
  resources :blogs do
      collection do
          post :confirm
      end 
    resources :comments
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
