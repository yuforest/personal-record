Rails.application.routes.draw do
 root to: 'home#index'

  get 'home/index'

  resources :records do
   collection do
    post :confirm
   end
  end
  
end
