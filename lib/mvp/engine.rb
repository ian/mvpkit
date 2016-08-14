module Mvp
  class Engine < ::Rails::Engine
    isolate_namespace Mvp
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
