# frozen_string_literal: true

class LogPrinterFactory
  def self.for(views_pages_obj, count_views)
    task_unique = views_pages_obj.task_uniq
    views_pages = views_pages_obj.views_pages
    if task_unique
      PrintUniqueViews.new(views_pages, count_views)
    else
      PrintMostViews.new(views_pages, count_views)
    end
  end
end
