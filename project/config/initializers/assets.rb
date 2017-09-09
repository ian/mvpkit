Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Be sure to restart your server when you modify this file.
# ExecJS.runtime = ExecJS::Runtimes::Node

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths += [
  Rails.root.join('public', 'assets', 'javascripts'),
  Rails.root.join('node_modules')
]

# Rails.application.config.assets.digest = true
# Rails.application.config.assets.enabled = true
Rails.application.config.assets.initialize_on_precompile = true

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

# Extended control, from http://9elements.com/io/babel-rails-5-and-sprockets-4/
# Rails.application.config.assets.configure do |env|
#   Sprockets::Commoner::Processor.configure(env,
#     # include, exclude, and babel_exclude patterns can be path prefixes or regexes.
#     # Explicitely list paths to include. The default is `[env.root]`
#     include: ['app/assets/javascripts/subdirectory'],
#     # List files to ignore and not process require calls or apply any Babel transforms to. Default is ['vendor/bundle'].
#     exclude: ['vendor/bundle', /ignored/],
#     # Anything listed in babel_exclude has its require calls resolved, but no transforms listed in .babelrcs applied.
#     # Default is [/node_modules/]
#     babel_exclude: [/node_modules/]
#   )
# end
