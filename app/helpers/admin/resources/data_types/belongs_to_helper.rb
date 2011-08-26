module Admin::Resources::DataTypes::BelongsToHelper

  def typus_belongs_to_field(attribute, form)
    association = @resource.reflect_on_association(attribute.to_sym)

    related = if defined?(set_belongs_to_context)
                set_belongs_to_context.send(attribute.pluralize.to_sym)
              else
                association.class_name.constantize
              end
    related_fk = association.foreign_key

    html_options = { :disabled => attribute_disabled?(attribute) }
    label_text = @resource.human_attribute_name(attribute)

=begin
    # TODO: Make it work as we expect.
    # TODO: Use the build_add_new method.
    if admin_user.can?('create', related)
      options = { :controller => "/admin/#{related.to_resource}",
                  :action => 'new',
                  :resource => @resource.model_name,
                  :layout => 'admin/headless' }
      # Pass the resource_id only to edit/update because only there is where
      # the record actually exists.
      options.merge!(:resource_id => @item.id) if %w(edit update).include?(params[:action])
      # This is a default message ... which we can change if
      unless html_options[:disabled] == true || headless_mode?
        label_text_more = link_to Typus::I18n.t("Add New"), options, { :class => 'iframe' }
      end
    end
=end

=begin
    if html_options[:disabled] == true
      label_text_more = Typus::I18n.t("Read only")
    end
=end

=begin
    label_text += " <small>#{label_text_more}</small>" if label_text_more.present?
=end

    values = if related.respond_to?(:roots)
               expand_tree_into_select_field(related.roots, related_fk)
             else
               related.order(related.typus_order_by).map { |p| [p.to_label, p.id] }
             end

    render "admin/templates/belongs_to",
           :association => association,
           :resource => @resource,
           :attribute => attribute,
           :attribute_id => "#{@resource.table_name}_#{attribute}",
           :form => form,
           :related_fk => related_fk,
           :related => related,
           :label_text => label_text.html_safe,
           :values => values,
           :html_options => html_options,
           :options => { :include_blank => true }
  end

  def table_belongs_to_field(attribute, item)
    if att_value = item.send(attribute)
      action = item.send(attribute).class.typus_options_for(:default_action_on_item)
      message = att_value.to_label
      if admin_user.can?(action, att_value.class.name)
        message = link_to(message, :controller => "/admin/#{att_value.class.to_resource}", :action => action, :id => att_value.id)
      end
    end

    message || mdash
  end

  def display_belongs_to(item, attribute)
    data = item.send(attribute)
    link_to data.to_label, { :controller => data.class.to_resource,
                             :action => data.class.typus_options_for(:default_action_on_item),
                             :id => data.id }
  end

  def belongs_to_filter(filter)
    att_assoc = @resource.reflect_on_association(filter.to_sym)
    class_name = att_assoc.options[:class_name] || filter.capitalize.camelize
    resource = class_name.constantize

    items = [[Typus::I18n.t("View all %{attribute}", :attribute => @resource.human_attribute_name(filter).downcase.pluralize), ""]]
    items += resource.order(resource.typus_order_by).map { |v| [v.to_label, v.id] }
  end

end
