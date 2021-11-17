# frozen_string_literal: true

class PrintUniqueViews < BasePrinter
  def print_views
    print_header
    views_pages.each do |page|
      column_page_size = space_for_page - page.size
      result << "#{page}#{' ' * column_page_size}|   #{pages[page].uniq.size}"
    end
    result
  end
end
