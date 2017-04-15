Admin::Engine.routes.draw do
  resources :conversions
  root to: redirect('conversions')
end
