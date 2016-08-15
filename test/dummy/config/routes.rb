Rails.application.routes.draw do
  mount MinimumViableProduct::Engine => "/"
  root to: 'home#index'
end
