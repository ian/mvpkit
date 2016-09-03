Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << MinimumViableProduct::Engine.root.join('app')
