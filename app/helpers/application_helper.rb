module ApplicationHelper
  def nav_link(link_text, link_path, options = {})
    if options[:controller]
      active = controller_name.eql?(link_path)
    else
      active = current_page?(link_path) || request.original_url.include?(link_path.to_s)
    end

    if !active and options[:alternative_paths]
      for alternative_path in options[:alternative_paths]
        active = active || current_page?(alternative_path) || request.original_url.include?(alternative_path.to_s)
      end
    end

    class_name = 'active' if active
    link_path = '/' + link_path if options[:controller]

    content_tag(:li, class: class_name)  do
      link_to link_text, link_path
    end
  end
end
