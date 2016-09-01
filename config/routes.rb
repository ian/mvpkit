MinimumViableProduct::Engine.routes.draw do
  if Rails.env.development?
    get 'styleguide', to: 'styleguide#index'
    get 'styleguide/bootstrap', to: 'styleguide#bootstrap'
    ['basic','cover','carousel'].each do |layout|
      get "styleguide/layouts/#{layout}", to: "styleguide#layout_#{layout}"
    end
  end

  get 'robots.txt', to: 'seo#robots', as: :robots
  get '/sitemap.xml.gz', to: redirect("https://#{ENV['AWS_S3_BUCKET']}.s3.amazonaws.com/#{ENV['PROJECT_NAME']}/sitemaps/sitemap.xml.gz"), as: :sitemap

  get 'analytics/optout', to: 'analytics#optout'
end
