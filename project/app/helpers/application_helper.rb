module ApplicationHelper
  def render_partial(partial, locals={}, &block)
    render(
      partial: partial,
      locals: locals.merge(block: block)
    )
  end

  def render_mustache(template, object)
    mustache = Mustache.new
    mustache.template_extension = 'mustache'
    # mustache.template_path = Rails.root.join("assets/templates")
    # mustache.template_file = Rails.root.join("assets/templates/#{template}.mustache")
    mustache.template_path = Rails.root.join("app/views")
    mustache.template_file = Rails.root.join("app/views/#{template}.mustache")
    mustache.instance_eval %%
      def logged_in
        #{!!current_user}
      end
    %
    # mustache.template_extension = 'mustache'
    mustache.render(object).html_safe
  end
end
