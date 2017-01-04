SmtRails.configure do |config|
  config.template_extension = 'mustache' # change extension of mustache templates
  config.action_view_key    = 'mustache' # change name of key for rendering in ActionView mustache template
  config.template_namespace = 'SMT'      # change templates namespace in javascript
  # config.template_base_path = Rails.root.join("assets", "templates") # templates dir
  config.template_base_path = Rails.root.join("app", "views")
end
