Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.browserify_rails.paths << Rails.root.join('node_modules')
Rails.application.config.browserify_rails.paths << -> (p) { p.start_with?(MinimumViableProduct::Engine.root.join("app").to_s) }
Rails.application.config.browserify_rails.paths << MinimumViableProduct::Engine.root.join('app')
