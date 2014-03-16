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

  def get_operating_system
    if request.env['HTTP_USER_AGENT'].downcase.match(/mac/i)
      "Mac"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/windows/i)
      "Windows"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/linux/i)
      "Linux"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/unix/i)
      "Unix"
    else
      "Unknown"
    end
  end
end
