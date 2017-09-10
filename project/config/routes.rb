require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web       => '/sidekiq'
  mount Admin::Engine      => '/a' # avoid /admin, lots of script kiddies target this

  get      'conversion', to: 'home#conversion', as: :conversion
  resource :conversion, only: [:create]
  root     'home#index'

  get 'analytics/optout', to: 'analytics#optout'
  get 'robots.txt', to: 'seo#robots', as: :robots
  get 'sitemap.xml.gz', to: redirect("https://#{ENV['AWS_S3_BUCKET']}.s3.amazonaws.com/#{Rails.application.class.parent_name.underscore}/sitemaps/sitemap.xml.gz"), as: :sitemap
end
