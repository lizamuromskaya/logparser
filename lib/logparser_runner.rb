# frozen_string_literal: true

class LogparserRunner
  attr_reader :pages

  def initialize(file_path)
    FileValidator.new.validate(file_path)
    @pages = LogParser.new(file_path).parse
  end

  def run
    sorted_pages = PagesSorter.new(pages)
    count_of_views = ViewsCounter.new(pages)
    count_most_views = count_of_views.counter_most_views
    views_pages_obj = sorted_pages.most_views
    printer = LogPrinterFactory.for(views_pages_obj, count_most_views)
    puts printer.print_views
    views_pages_obj = sorted_pages.unique_views
    count_unique_views =  count_of_views.counter_unique_views
    printer = LogPrinterFactory.for(views_pages_obj, count_unique_views)
    puts printer.print_views
  end
end
