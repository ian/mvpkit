module ApplicationHelper
  def body_id
    "#{controller_name}-#{action_name}-page"
  end

  def body_classes
    klass = []
    klass << "#{controller_name}-pages"
    klass << page.classes if page.classes.present?
    klass.join(' ')
  end

  def render_partial(partial, locals={}, &block)
    render(
      partial: partial,
      locals: locals.merge(block: block)
    )
  end

  def render_mustache(template, object)
    mustache = Mustache.new
    mustache.template_extension = 'mustache'
    mustache.template_path = Rails.root.join("app/templates")
    mustache.template_file = Rails.root.join("app/templates/#{template}.mustache")
    mustache.instance_eval %%
      def logged_in
        #{!!current_user}
      end
    %
    # mustache.template_extension = 'mustache'
    mustache.render(object).html_safe
  end

  def store_and_redirect_path(path)
    url_for(:only_path => false, :trailing_slash => true) + "r/" + path
  end
end
