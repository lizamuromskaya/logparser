# frozen_string_literal: true

class PrintMostViews < BasePrinter
  attr_reader :result, :views_pages, :count_views, :space_for_page

  def initialize(views_pages, count_views)
    @result = []
    @views_pages = views_pages
    @space_for_page = 0
    @count_views = count_views
  end

  def print_header
    space_for_page = views_pages.max_by(&:length).size + 3
    count_of_spaces_before_page = (space_for_page / 2) - 2
    count_of_spaces_after_page = space_for_page - count_of_spaces_before_page - 4
    result << 'List with most page views'
    result << "#{' ' * count_of_spaces_before_page}Page#{' ' * count_of_spaces_after_page}| Views"
    space_for_page
  end

  def print_views
    space_for_page = print_header
    views_pages.each do |page|
      column_page_size = space_for_page - page.size
      result << "#{page}#{' ' * column_page_size}|   #{count_views[page]}"
    end
    result
  end
end
