module Admin::Resources::ListHelper

  def list_actions
    resources_actions.map do |body, url, options|
      if admin_user.can?(url[:action], @resource.name)
        path = params.dup.merge!(url).compact.cleanup
        link_to Typus::I18n.t(body), path, options
      end
    end.compact.join(" / ").html_safe
  end

  def build_actions(&block)
    render "helpers/admin/resources/actions", :block => block
  end

  #--
  # If partial `list` exists we will use it. This partial will have available
  # the `@items` so we can do whatever we want there. Notice that pagination
  # is still available.
  #++
  def build_list(model, fields, items, resource = @resource.to_resource, link_options = {}, association = nil, association_name = nil)
    render "admin/#{resource}/list", :items => items
  rescue ActionView::MissingTemplate
    build_table(model, fields, items, link_options, association, association_name)
  end

  def scopes
    @resource.typus_defaults_for(:scopes).reject { |s| !@resource.respond_to?(s) }
  end

end
