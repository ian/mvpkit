MinimumViableProduct::Engine.routes.draw do
  get 'robots.txt', to: 'seo#robots', as: :robots
  get '/sitemap.xml.gz', to: redirect("https://#{ENV['AWS_S3_BUCKET']}.s3.amazonaws.com/#{Rails.application.class.parent_name.underscore}/sitemaps/sitemap.xml.gz"), as: :sitemap

  get 'analytics/optout', to: 'analytics#optout'
end
