module ApplicationHelper
  def sortable(column, title)
    sort_this = (column == sort_column)
    direction = (sort_this and sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = sort_this ? direction == 'asc' ? 'desc' : 'asc' : nil
    link_to title, { :sort => column, :direction => direction }, :class => css_class
  end
end
