Admin::Engine.routes.draw do
  resources :conversions
  resources :users
  
  root to: redirect('conversions')
end
