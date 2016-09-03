Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.browserify_rails.paths << Rails.root.join('node_modules')
Rails.application.config.browserify_rails.paths << MinimumViableProduct::Engine.root.join('app')
