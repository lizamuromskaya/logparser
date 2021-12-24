# frozen_string_literal: true

class PagesSorter
  attr_reader :pages

  def initialize(pages)
    @pages = pages
  end

  def most_views
    views_pages = pages.keys.sort_by { |key| pages[key].size }.reverse
    task_uniq = false
    PagesData.new(views_pages, task_uniq)
  end

  def unique_views
    views_pages = pages.keys.sort_by { |key| pages[key].uniq.size }.reverse
    task_uniq = true
    PagesData.new(views_pages, task_uniq)
  end
end
