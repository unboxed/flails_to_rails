module ApplicationHelper
  def navbar_item(title, path)
    klass = request.path == path ? 'active' : nil
    content_tag :li, :class => klass do
      link_to title, path
    end
  end
end
