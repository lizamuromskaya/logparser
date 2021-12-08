# frozen_string_literal: true

class BasePrinter
  attr_reader :result, :views_pages, :space_for_page, :count_views

  def initialize(views_pages, message, count_views, result = nil, space_for_page = nil)
    @message = message
    @result = result
    @views_pages = views_pages
    @space_for_page = space_for_page
    @count_views = count_views
  end

  def print_header
    @result = []
    @space_for_page = @views_pages.max_by(&:length).size + 3
    count_of_spaces_before_page = (@space_for_page / 2) - 2
    count_of_spaces_after_page = @space_for_page - count_of_spaces_before_page - 4
    @result << @message
    @result << "#{' ' * count_of_spaces_before_page}Page#{' ' * count_of_spaces_after_page}| Views"
  end
end
