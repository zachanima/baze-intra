module ApplicationHelper
  def sortable(column, title)
    style = sort_direction if column == sort_column
    direction = (style == 'asc') ? 'desc' : 'asc'
    link_to title, { :sort => column, :direction => direction }, :class => style
  end
end
