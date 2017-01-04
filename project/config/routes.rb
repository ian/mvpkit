Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount MVP::Engine => "/"

  scope path: '/examples' do
    get      'mustache', to: 'examples#mustache', as: :mustache_example
    get      '',         to: 'examples#index',    as: :examples
  end

  get      'conversion', to: 'home#conversion', as: :conversion
  resource :conversion, only: [:create]
  root     'home#index'
end
