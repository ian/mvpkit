if ENV['ALGOLA_APP_ID']
  AlgoliaSearch.configuration = {
    application_id:     ENV['ALGOLA_APP_ID'],
    api_key:            ENV['ALGOLA_API_KEY'],
    pagination_backend: :kaminari
  }
end
