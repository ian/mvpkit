Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    get 'styleguide', to: 'minimum_viable_product/styleguide#index'
    get 'styleguide/bootstrap', to: 'minimum_viable_product/styleguide#bootstrap'
    ['basic','cover','carousel'].each do |layout|
      get "styleguide/layouts/#{layout}", to: "minimum_viable_product/styleguide#layout_#{layout}"
    end
  end

  get 'robots.txt', to: 'minimum_viable_product/seo#robots', as: :robots
  get '/sitemap.xml.gz', to: redirect("https://#{ENV['AWS_S3_BUCKET']}.s3.amazonaws.com/nailsalons/sitemaps/sitemap.xml.gz"), as: :sitemap

  get 'analytics/optout', to: 'minimum_viable_product/analytics#optout'
end
