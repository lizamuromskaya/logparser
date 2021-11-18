# frozen_string_literal: true

class LogPrinterFactory
  def self.for(views_pages_obj, pages)
    task_unique = views_pages_obj.task_uniq
    views_pages = views_pages_obj.views_pages
    header_unique_views = 'List with most unique page views'
    header_most_views = 'List with most page views'
    if task_unique
      PrintUniqueViews.new(views_pages, pages, header_unique_views)
    else
      PrintMostViews.new(views_pages, pages, header_most_views)
    end
  end
end
